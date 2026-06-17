---
description: Foot-traffic, mobility, demographic, trade-area, market quality, competitive, cannibalization, and closure-impact analytics for any address or area.
---

# Factori Analytics & Reports

Factori's analytics tools provide mobility, foot-traffic, demographic, and competitive intelligence for any address or area.

## When to use
When the user asks about foot traffic, visit trends, visitor demographics, trade areas, market quality, competitive benchmarking, cannibalization risk, or site selection for a location.

## Available tools and what they return

| Tool | Returns |
|------|---------|
| `get_visit_trends` | Daily or hourly foot-traffic over a time range |
| `get_area_pulse` | Morning / daytime / night device counts + late-night POI activity |
| `get_visitor_profile` | Demographic profile of actual visitors (income, age, education, gender) |
| `get_demographics_report` | Residential demographics of the surrounding area |
| `get_area_snapshot` | Commercial landscape: POI count, categories, brands, ratings, hours |
| `get_market_quality` | Opportunity level (High/Medium/Low), saturation, vulnerable POI % |
| `get_trade_area` | Where visitors come from (origin hexes) + visitor demographic profile |
| `compare_locations` | Side-by-side scorecard for 2–10 locations |
| `assess_cannibalization_risk` | Gravity-model overlap between a proposed site and existing network |
| `analyze_closure_impact` | Customer redistribution when a store closes |

## Common patterns

**Site selection** → area_snapshot → visit_trends → demographics → visitor_profile → trade_area → market_quality

**Competitive analysis** → compare_locations → visitor_profile (for each)

**Campaign planning** → visitor_profile → trade_area → demographics

**Store network decisions** → compare_locations → assess_cannibalization_risk or analyze_closure_impact

## Time range values
`LAST_7_DAYS`, `LAST_30_DAYS`, `LAST_90_DAYS`, `LAST_6_MONTHS`, `LAST_12_MONTHS`

## Granularity values
`daily`, `hourly`, `weekly`, `monthly`
