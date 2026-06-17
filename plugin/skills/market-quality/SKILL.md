---
description: "Scores how crowded and contestable a market is — saturation, share of weak players, price gaps — and returns an Enter / Differentiate / Avoid call."
---

# Market Quality

Audit the competitive quality and opportunity level of a market — saturation, vulnerable-POI %, price-tier gaps, rating distribution, and an Enter/Differentiate/Avoid verdict.

## Usage
`/factori:market-quality <location> [radius_km]`

## Examples
- `/factori:market-quality "SoHo, NYC"` — is the market saturated or is there room for a stronger operator to come in?
- `/factori:market-quality "Old Town Scottsdale"` — saturation and quality read
- `/factori:market-quality "Fishtown, Philadelphia"` — market quality read

## Instructions

1. Call `get_market_quality` — opportunity level (High/Medium/Low), avg rating, vulnerable POI %, claimed POI %, review volume.
2. Call `get_area_snapshot` — POI density, top brands, branded vs independent split, price tiers.

Synthesize into a Market Quality Report:
- **Opportunity Level**, saturation read (POI density vs competitive quality)
- Quality gap: % vulnerable POIs, branded vs independent mix
- Price tier distribution — premium gap or value gap?
- **Verdict**: Enter / Differentiate / Avoid

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
