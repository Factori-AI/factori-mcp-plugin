---
description: "Models what happens when a location shuts down — where its visitors go, how many you keep, and how many you lose to competitors."
---

# Closure Impact Analysis

Model what happens when a store closes — how much of its traffic your remaining network recaptures and how much bleeds to competitors.

## Usage
`/factori:closure-impact-analysis <closing_address> <remaining_addresses>`

## Examples
- `/factori:closure-impact-analysis "Midtown Atlanta location" "Buckhead store, Decatur store"` — will customers shift to own stores or defect to competitors?
- `/factori:closure-impact-analysis "Fremont Seattle" "Ballard store, Capitol Hill store"` — redistribution impact
- `/factori:closure-impact-analysis "Plano store" "Frisco store, Allen TX store"` — network absorption before shutting down

## Instructions

1. Split remaining_addresses by comma — label each Store 1, Store 2, … with radius_km=0.3.
2. Call `analyze_closure_impact`:
   - closing_site: `{label: "Closing", address: <closing_address>, radius_km: 0.3}`
   - remaining_network: list from step 1
   - time_range: "LAST_90_DAYS"

Synthesize into a Closure Impact Report:
- Customers at risk (total visits affected)
- **% retained by remaining network** vs **% lost to competitors**
- Per-store absorption rates, coverage gaps
- **Verdict**: Safe to close / Coverage gap / High customer loss

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
