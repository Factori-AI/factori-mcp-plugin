---
description: "Head-to-head diagnostic of your location vs a competitor — benchmarks foot traffic, visitor demographics, and audience quality to expose competitive advantages and vulnerabilities."
---

# Competitive Intelligence

Delivers a head-to-head diagnostic of your location's performance against a competitor. It directly benchmarks physical foot traffic volumes, contrasts visitor demographics, and evaluates audience profile quality to expose critical competitive advantages and vulnerabilities.

## Usage
`/factori:competitive-intelligence <my_location> <competitor_location> [radius_km]`

## Examples
- `/factori:competitive-intelligence "Analyze the customer overlap between the Marietta and Cobb Parkway locations and how do these two differ in overall traffic performance?"`
- `/factori:competitive-intelligence "Equinox Flatiron vs Planet Fitness Union Square, NYC"`
- `/factori:competitive-intelligence "My restaurant in Austin vs the competitor on South Congress"`

## Instructions

1. Call `compare_locations`:
   - locations: `[{label: "Mine", address: <my_location>, radius_km: <radius_km>}, {label: "Competitor", address: <competitor_location>, radius_km: <radius_km>}]`
   - metrics: ["all"], time_range: "LAST_30_DAYS", benchmark: "Mine"
2. Call `get_trade_area` — for each location to compare catchment and market overlap.
3. Call `get_market_quality` — opportunity level and competitive saturation.
4. Call `get_area_snapshot` — POI mix, top brands for each location.
5. Call `get_visit_trends` — daily, LAST_30_DAYS unless user specifies — traffic trend comparison.

Synthesize:
- Composite scores (traffic + demographics pillars), winner per pillar
- Key differentiators, score gap
- **Strategic Recommendation**: where to differentiate, where to defend
