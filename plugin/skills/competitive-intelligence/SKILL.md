---
description: "Compares two locations head-to-head on traffic, visitor demographics, and audience quality to expose advantages and weaknesses."
---

# Competitive Intelligence

Head-to-head comparison of your location vs a named competitor — traffic volume, catchment strength, market quality, commercial mix, and where you're gaining or losing ground.

## Usage
`/factori:competitive-intelligence <my_location> <competitor_location> [radius_km]`

## Examples
- `/factori:competitive-intelligence "Target Marietta GA" "Walmart Marietta GA"` — foot traffic, customer quality, where you're losing ground
- `/factori:competitive-intelligence "Equinox Flatiron NYC" "Planet Fitness Union Square NYC"` — head-to-head benchmark
- `/factori:competitive-intelligence "my Austin restaurant" "competitor South Congress Austin"` — competitive position read

## Instructions

1. Call `compare_locations`:
   - locations: `[{label: "Mine", address: <my_location>, radius_km: <radius_km>}, {label: "Competitor", address: <competitor_location>, radius_km: <radius_km>}]`
   - metrics: ["all"], time_range: "LAST_30_DAYS", benchmark: "Mine"
2. Call `get_trade_area` for each location — catchment size, visitor origins, audience profile.
3. Call `get_market_quality` for each — saturation, opportunity level, vulnerable POI %.
4. Call `get_area_snapshot` for each — commercial mix, top brands, ratings, price tiers.
5. Call `get_visit_trends` for each — LAST_30_DAYS — momentum and trend direction.

Synthesize:
- Composite scores (traffic + demographics pillars), winner per pillar
- Catchment size comparison, market quality gap
- Commercial mix and trend momentum comparison
- **Strategic Recommendation**: where to differentiate, where to defend

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
