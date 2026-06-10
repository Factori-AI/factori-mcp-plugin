---
description: "Deep trade area analysis — where visitors come from, who they are, primary vs secondary catchment breakdown."
---

# Trade Area Deep Dive

Map exactly where visitors come from and who they are — primary catchment (50% of visits), secondary catchment (80%), and full audience profile.

## Usage
`/factori:trade-area-deep-dive <location> [radius_km]`

## Examples
- `/factori:trade-area-deep-dive "Lenox Square Mall, Atlanta"`
- `/factori:trade-area-deep-dive "Times Square, NYC" 0.5`

## Instructions

1. Call `get_trade_area` — origin hex list, coverage quality, visitor demographic and economic profile.
2. Call `get_visitor_profile` — full audience breakdown (income, net worth, education, age, gender, household size).

Synthesize into a Trade Area Report:
- Top 20 origin hexes by visit fraction
- Primary catchment (50% of visitors), secondary catchment (80%)
- Visitor demographic profile, coverage quality metrics
- Insight: hyper-local / commuter / regional draw?
