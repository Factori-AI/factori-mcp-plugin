---
description: "Holistic business landscape analysis — commercial mix, top brands, traffic momentum over 90 days, business climate verdict."
---

# Area Business Analysis

Full business landscape analysis for an area — commercial mix, traffic momentum over 90 days, and an overall business climate verdict.

## Usage
`/factori:area-business-analysis <location> [radius_km]`

## Examples
- `/factori:area-business-analysis "Downtown Atlanta"`
- `/factori:area-business-analysis "Midtown Manhattan, NYC" 0.5`
- `/factori:area-business-analysis "Whitefield, Bangalore" 1.0`

## Instructions

1. Call `get_area_snapshot` — total POIs, category distribution, top brands, ratings, hours, accessibility.
2. Call `get_market_quality` — opportunity level + rating saturation.
3. Call `get_visit_trends` — daily, LAST_90_DAYS — area momentum.

Synthesize:
- Commercial mix, top 10 brands, quality bar, operational profile
- **Traffic Momentum**: growing / stable / declining
- **Business Climate**: Vibrant / Stable / Soft
