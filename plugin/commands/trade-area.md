---
description: "Analyze visits, visitor demographics, traffic patterns by time of day, and visitor origins to gain a comprehensive understanding of location performance and audience behavior."
---

# Trade Area

Analyze visits, visitor demographics, traffic patterns by time of day, and visitor origins to gain a comprehensive understanding of location performance and audience behavior.

## Usage
`/factori:trade-area <location> [radius_km]`

## Examples
- `/factori:trade-area "I want to understand exactly where shoppers at the Galleria mall in Houston are coming from and who they are so I can plan my catchment strategy."`
- `/factori:trade-area "Where do Pike Place Market, Seattle visitors come from?"`
- `/factori:trade-area "Catchment analysis for Disney Springs, Orlando"`

## Instructions

1. Call `get_trade_area` — origin hex list, coverage quality, visitor demographic and economic profile.
2. Call `get_area_pulse` — time-of-day intensity, late-night %, weekday vs weekend pattern.
3. Call `get_area_snapshot` — commercial context, POI mix, top brands.

Synthesize into a Trade Area Report:
- Top 20 origin hexes by visit fraction
- Primary catchment (50% of visitors), secondary catchment (80%)
- Visitor demographic profile, coverage quality metrics
- Insight: hyper-local / commuter / regional draw?
