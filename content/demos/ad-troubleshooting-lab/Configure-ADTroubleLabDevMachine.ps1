Import-Lab -Name 'ADTroubleLab' -NoValidation

$client = Get-LabVM -ComputerName *dev*
$rootDc = Get-LabVM -role RootDC

Invoke-LabCommand -ActivityName 'Install RSAT' -ScriptBlock {
    Install-WindowsFeature -Name RSAT-AD-Tools, GPMC -IncludeAllSubFeature
} -ComputerName $client

$param = @{
    ActivityName = 'Create Test Users'
    FilePath = "$labSources\PostInstallationActivities\PrepareFirstChildDomain\New-ADLabAccounts 2.0.ps1"
    ComputerName = $rootDc
    DependencyFolderPath = "$labSources\PostInstallationActivities\PrepareFirstChildDomain"
    PassThru = $true
}
Invoke-LabCommand @param

#$global:labSources

Invoke-LabCommand -ActivityName 'Configure Dev Machine' -ComputerName $client.Name -ScriptBlock {
    # Set execution policy for this process
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force

    # Configure TLS 1.2 support
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

    # Download and install Chocolatey
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    choco install powershell-core -y
    choco install git.install -y
    choco install vscode -y
    choco install nodejs -y
    choco install notepadplusplus -y

    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    Install-Module -Name PSScriptAnalyzer -Scope AllUsers -Force
    Install-Module -Name Pester -Scope AllUsers -Force -AllowClobber -SkipPublisherCheck

    $env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'User')

    git config --global user.email 'dev@example.com'
    git config --global user.name 'Lab Developer'

}

Write-Host 'Taking Healthy-Baseline snapshot...'
Checkpoint-LabVM -All -SnapshotName 'Healthy-Baseline2'
Write-Host 'Baseline snapshot saved.' -ForegroundColor Green