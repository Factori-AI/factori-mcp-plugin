---
description: "Head-to-head comparison of your location vs a named competitor across traffic, demographics, and audience quality."
---

# Competitive Density

Compare your location head-to-head against a competitor across traffic volume, demographic strength, and audience quality.

## Usage
`/factori:competitive-density <my_location> <competitor_location> [radius_km]`

## Examples
- `/factori:competitive-density "I want to see how my Target in Marietta, GA stacks up against the Walmart down the road in terms of foot traffic and customer quality, and where I'm losing ground."`
- `/factori:competitive-density "Equinox Flatiron vs Planet Fitness Union Square, NYC"`
- `/factori:competitive-density "My restaurant in Austin vs the competitor on South Congress"`

## Instructions

1. Call `compare_locations`:
   - locations: `[{label: "Mine", address: <my_location>, radius_km: <radius_km>}, {label: "Competitor", address: <competitor_location>, radius_km: <radius_km>}]`
   - metrics: ["all"], time_range: "LAST_30_DAYS", benchmark: "Mine"
2. Call `get_trade_area` — for each location to compare catchment and market overlap.
3. Call `get_market_quality` — opportunity level and competitive saturation.
4. Call `get_area_snapshot` — POI mix, top brands for each location.
5. Call `get_visit_trends` — daily, LAST_30_DAYS — traffic trend comparison.

Synthesize:
- Composite scores (traffic + demographics pillars), winner per pillar
- Key differentiators, score gap
- **Strategic Recommendation**: where to differentiate, where to defend
