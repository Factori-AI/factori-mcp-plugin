---
description: "Side-by-side benchmark of your location vs a competitor across traffic, demographics, and audience pillars."
---

# Competitive Benchmark

Compare your location head-to-head against a competitor across traffic volume, demographic strength, and audience quality.

## Usage
`/factori:competitive-benchmark <my_location> <competitor_location> [radius_km]`

## Examples
- `/factori:competitive-benchmark "100 Main St, Atlanta" "200 Broad St, Atlanta"`
- `/factori:competitive-benchmark "My Store, NYC" "Competitor Store, NYC" 0.5`

## Instructions

1. Call `compare_locations`:
   - locations: `[{label: "Mine", address: <my_location>, radius_km: <radius_km>}, {label: "Competitor", address: <competitor_location>, radius_km: <radius_km>}]`
   - metrics: ["all"], time_range: "LAST_30_DAYS", benchmark: "Mine"
2. Optionally call `get_visitor_profile` for each location for audience deep-dive.

Synthesize:
- Composite scores (traffic + demographics pillars), winner per pillar
- Key differentiators, score gap
- **Strategic Recommendation**: where to differentiate, where to defend
