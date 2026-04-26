# Agenda

This folder contains the presentation agenda with the **three-version architecture**.

## Contents

- **presentation-agenda.md** - Master agenda defining all three versions:
  - **1-Hour Keynote** — Conference, meetup, or lunch & learn (no breaks)
  - **2-Hour Standard** — Team, department, or customer briefing (1 break)
  - **4-Hour Workshop** — Practitioner deep dive with demos (2 breaks + lunch)

## Architecture: Single Source, Three Versions

All three versions share the **same module content** in `content/slides/`. The agenda defines:

1. **Module Inclusion Matrix** — which modules appear in which version
2. **Slide Inclusion Guide** — which slides within each module to present per version
3. **Timing tables** — exact timing for each version

Each slide file has a **Version Guide** table at the top showing per-slide inclusion.

> **DRY Principle**: Update content once in `content/slides/`. All versions automatically inherit changes. Only update the agenda if you add/remove/reorder modules.

## Usage

1. Choose your version (1h, 2h, or 4h) based on the event
2. Refer to the Module Inclusion Matrix for the big picture
3. Open each module’s slide file and follow its Version Guide table
4. Review the Facilitator Notes for your chosen version