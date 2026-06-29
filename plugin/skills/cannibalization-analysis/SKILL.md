---
description: "Estimates how much a proposed new location would pull from your existing ones and returns a Go / No-Go / Adjust call."
---

# Cannibalization Analysis

Estimate how much a new location would cannibalize your existing stores — gravity model, per-store impact breakdown, and a Go/No-Go/Adjust call.

## Usage
`/factori:cannibalization-analysis <proposed_address> <existing_addresses> [competitor_addresses]`

## Examples
- `/factori:cannibalization-analysis "Santa Monica cafe" "Venice cafe, Culver City cafe"` — how much new traffic is net-new vs cannibalized from own stores
- `/factori:cannibalization-analysis "Williamsburg store" "Bushwick store, Greenpoint store"` — overlap assessment
- `/factori:cannibalization-analysis "River North Chicago" "Wicker Park store, West Loop store"` — cannibalization check before opening

## Instructions

1. Split existing_addresses by comma — label each Store 1, Store 2, … with radius_km=0.3.
2. If competitor_addresses provided, build the competitors list the same way.
3. Call `assess_cannibalization_risk`:
   - proposed_site: `{label: "Proposed", address: <proposed_address>, radius_km: 0.3}`
   - existing_network: list from step 1
   - competitors: list from step 2 (omit if empty)
   - time_range: "LAST_30_DAYS"

Synthesize into a Cannibalization Report:
- **Risk Label** (Low / Medium / High)
- Cannibalization rate %, per-store impact breakdown
- Competitor capture share, net new visits estimate
- **Recommendation**: Go / No-Go / Adjust radius

## Visualization

After gathering the data, render an inline visual dashboard if the host exposes a chart/visualization tool (e.g. visualize:show_widget on Claude.ai, or any equivalent renderer):
- KPI cards for the headline numbers (scores, counts, rates, the verdict/recommendation).
- Bar/donut charts for distributions (category mix, price tiers, atmosphere, demographics, dayparts).
- Horizontal bars for top-N lists (top brands, top categories, origin hexes, ranked locations).
- Line/area charts for any time series (visit trends, momentum).

Pair every chart with a short written interpretation — never return charts alone. If NO chart tool is available, fall back to clean Markdown tables and state that charts aren't available in this host; never silently drop the visuals.

## Response guidance

Read the entire tool output before answering. Parse every field of every result — including large or truncated payloads. If a result was saved to a file because it was too big, extract the needed fields (e.g. with jq); never skip a section (like the category breakdown) just because the data was long.

Answer according to the user's prompt. Lead with what they actually asked (e.g. a leasing decision, operating hours, audience targeting, a Go/No-Go call) and frame every section toward that intent. Surface the parts of the data most relevant to their goal first; don't return a generic, undifferentiated dump.

## Report Format

Read and apply `plugin/shared/output-spec.md` — it defines all formatting rules, beat structure, typography, dashboard/visual spec, PPTX helpers, branding, and the QA checklist. Apply every rule in that spec exactly.

**Scorecard KPIs (Beat 2):** Cannibalization rate % · Net-new visits % · Competitor capture % · Risk level

| | |
|---|---|
| **Verdict label** | Risk Low / Med / High → Go / No-Go / Adjust |
| **Evidence blocks (in order)** | Cannibalization rate % · Per-store impact · Competitor capture share · Net-new visits estimate |
