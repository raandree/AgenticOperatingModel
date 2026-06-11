#requires -Version 7
# Throwaway: inspect mono sources #9/#10, produce transparent variants, composite
# each on #0d1117 and #ffffff for visual comparison. Deleted after the decision.
Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing
$null = [System.Drawing.Bitmap]::new(1, 1)
$refs = [System.Collections.Generic.List[string]]::new()
$refs.AddRange([string[]]@('System.Drawing.Common', 'System.Drawing.Primitives',
        'System.Runtime', 'System.Runtime.InteropServices', 'netstandard', 'System.Collections'))
$spwc = [AppDomain]::CurrentDomain.GetAssemblies() |
    Where-Object { $_.GetName().Name -eq 'System.Private.Windows.Core' } | Select-Object -First 1
if ($spwc) { $refs.Add($spwc.Location) }   # REQUIRED on .NET 10

Add-Type -ReferencedAssemblies $refs -TypeDefinition @'
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Text;

public static class Mono
{
    static byte[] Load(string p, out int w, out int h, out int s) {
        using (var b = new Bitmap(p)) {
            w = b.Width; h = b.Height;
            var d = b.LockBits(new Rectangle(0,0,w,h), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
            s = d.Stride; var buf = new byte[s*h];
            Marshal.Copy(d.Scan0, buf, 0, buf.Length); b.UnlockBits(d); return buf;
        }
    }
    static void SaveCrop(byte[] b, int w, int h, int s, string op, int margin) {
        int minX=w,minY=h,maxX=-1,maxY=-1;
        for (int y=0;y<h;y++) for (int x=0;x<w;x++) if (b[y*s+x*4+3]>10){
            if(x<minX)minX=x; if(x>maxX)maxX=x; if(y<minY)minY=y; if(y>maxY)maxY=y; }
        if (maxX<0) { using(var e=new Bitmap(1,1,PixelFormat.Format32bppArgb)) e.Save(op, ImageFormat.Png); return; }
        minX=Math.Max(0,minX-margin); minY=Math.Max(0,minY-margin);
        maxX=Math.Min(w-1,maxX+margin); maxY=Math.Min(h-1,maxY+margin);
        int cw=maxX-minX+1, ch=maxY-minY+1;
        using (var dst=new Bitmap(cw,ch,PixelFormat.Format32bppArgb)) {
            var d=dst.LockBits(new Rectangle(0,0,cw,ch), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
            int ds=d.Stride; var o=new byte[ds*ch];
            for (int y=0;y<ch;y++) for (int x=0;x<cw;x++) {
                int si=(minY+y)*s+(minX+x)*4, di=y*ds+x*4;
                o[di]=b[si]; o[di+1]=b[si+1]; o[di+2]=b[si+2]; o[di+3]=b[si+3]; }
            Marshal.Copy(o,0,d.Scan0,o.Length); dst.UnlockBits(d); dst.Save(op, ImageFormat.Png);
        }
    }

    public static string Probe(string path) {
        var sb = new StringBuilder();
        int w,h,s; var b = Load(path, out w, out h, out s);
        using (var bb = new Bitmap(path)) sb.AppendLine(System.IO.Path.GetFileName(path)+"  "+w+"x"+h+"  "+bb.PixelFormat);
        Func<int,int,string> px=(x,y)=>{int i=y*s+x*4; return "A"+b[i+3]+" R"+b[i+2]+" G"+b[i+1]+" B"+b[i];};
        sb.AppendLine("  TL="+px(0,0)+"  TR="+px(w-1,0)+"  BL="+px(0,h-1)+"  C="+px(w/2,h/2));
        var hist=new Dictionary<int,int>();
        for (int y=0;y<h;y+=2) for (int x=0;x<w;x+=2){ int i=y*s+x*4; int B=b[i],G=b[i+1],R=b[i+2];
            int key=((R/32)<<10)|((G/32)<<5)|(B/32); if(!hist.ContainsKey(key))hist[key]=0; hist[key]++; }
        var top=new List<KeyValuePair<int,int>>(hist); top.Sort((a,c)=>c.Value.CompareTo(a.Value));
        sb.AppendLine("  Top colour buckets (R,G,B center  count):");
        for (int k=0;k<Math.Min(6,top.Count);k++){ int key=top[k].Key;
            int R=((key>>10)&31)*32+16,G=((key>>5)&31)*32+16,Bv=(key&31)*32+16;
            sb.AppendLine("    R"+R+" G"+G+" B"+Bv+"   "+top[k].Value); }
        return sb.ToString();
    }

    // Colour-to-alpha vs white: keeps the (teal) ink, drops the off-white field.
    public static void InkVsWhite(string ip, string op, int threshold, int margin) {
        int w,h,s; var b=Load(ip, out w, out h, out s);
        for (int i=0;i<b.Length;i+=4){ int B=b[i],G=b[i+1],R=b[i+2];
            int m=Math.Min(B,Math.Min(G,R)); int A=255-m;
            int Ao=(A-threshold)*255/(255-threshold);
            if (Ao<=0){ b[i]=b[i+1]=b[i+2]=b[i+3]=0; continue; }
            if (Ao>255) Ao=255;
            int fb=255+(B-255)*255/A, fg=255+(G-255)*255/A, fr=255+(R-255)*255/A;
            b[i]=(byte)Math.Max(0,Math.Min(255,fb)); b[i+1]=(byte)Math.Max(0,Math.Min(255,fg));
            b[i+2]=(byte)Math.Max(0,Math.Min(255,fr)); b[i+3]=(byte)Ao; }
        SaveCrop(b,w,h,s,op,margin);
    }

    // White-ink key: keeps near-white ink, drops the teal field. Alpha from the
    // MIN channel (white=255 opaque, teal min~16 transparent); ink forced to white.
    public static void WhiteInk(string ip, string op, int threshold, int margin) {
        int w,h,s; var b=Load(ip, out w, out h, out s);
        for (int i=0;i<b.Length;i+=4){ int B=b[i],G=b[i+1],R=b[i+2];
            int m=Math.Min(B,Math.Min(G,R));            // whiteness proxy
            int Ao=(m-threshold)*255/(255-threshold);
            if (Ao<=0){ b[i]=b[i+1]=b[i+2]=b[i+3]=0; continue; }
            if (Ao>255) Ao=255;
            b[i]=255; b[i+1]=255; b[i+2]=255; b[i+3]=(byte)Ao; }   // pure white ink
        SaveCrop(b,w,h,s,op,margin);
    }

    public static string ProbeOut(string p) {
        int w,h,s; var b=Load(p, out w, out h, out s);
        int tl=b[3], tr=b[(w-1)*4+3], bl=b[(h-1)*s+3], br=b[(h-1)*s+(w-1)*4+3];
        return System.IO.Path.GetFileName(p)+"  "+w+"x"+h+"  cornerA TL="+tl+" TR="+tr+" BL="+bl+" BR="+br;
    }

    public static void Composite(string ip, string op, int r, int g, int bl) {
        using (var src=new Bitmap(ip))
        using (var dst=new Bitmap(src.Width, src.Height, PixelFormat.Format32bppArgb))
        using (var gx=Graphics.FromImage(dst)) {
            gx.Clear(Color.FromArgb(r,g,bl)); gx.DrawImage(src,0,0,src.Width,src.Height);
            dst.Save(op, ImageFormat.Png);
        }
    }
}
'@

$src = '.work/src'; $chk = '.work/chk'
New-Item -ItemType Directory -Path $chk -Force | Out-Null

'== SOURCE INSPECTION =='
[Mono]::Probe("$src/mono-tealonwhite.png")
[Mono]::Probe("$src/mono-whiteonteal.png")

# #9 teal-on-white  -> teal ink, transparent
[Mono]::InkVsWhite("$src/mono-tealonwhite.png", "$chk/cand9-teal.png", 24, 16)
# #10 white-on-teal -> white ink, transparent
[Mono]::WhiteInk("$src/mono-whiteonteal.png",  "$chk/cand10-white.png", 60, 16)

'== GENERATED VARIANTS =='
[Mono]::ProbeOut("$chk/cand9-teal.png")
[Mono]::ProbeOut("$chk/cand10-white.png")

foreach ($v in 'cand9-teal','cand10-white') {
    [Mono]::Composite("$chk/$v.png", "$chk/$v--on-dark.png",  13, 17, 23)
    [Mono]::Composite("$chk/$v.png", "$chk/$v--on-light.png", 255, 255, 255)
}
'== composites in .work/chk =='
