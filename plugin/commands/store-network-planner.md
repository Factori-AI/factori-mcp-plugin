---
description: "Plan infrastructure placement (EV chargers, ATMs, towers) using foot traffic, time-of-day demand, and demographics."
---

# Store Network Planner

Plan infrastructure placement — foot traffic volume, time-of-day demand windows, and trade area data identify High Priority / Medium / Skip zones.

## Usage
`/factori:store-network-planner <metro_area> [infrastructure_type] [radius_km]`

## Examples
- `/factori:store-network-planner "I want to roll out a network of EV chargers across Austin and need to know which pockets have the demand and coverage gaps to justify a site."`
- `/factori:store-network-planner "Plan ATM locations across downtown Denver"`
- `/factori:store-network-planner "Site cell towers across the San Fernando Valley"`

## Instructions

1. Call `get_area_pulse` — when the area is active (morning/daytime/night), 24hr operation %, late-night activity.
2. Call `get_area_snapshot` — POI density, accessibility, parking.
3. Call `get_trade_area` — visitor origin distribution and catchment quality.

Synthesize into a Network Planning Report:
- **Demand Window**: peak hours for infrastructure usage
- 24hr / late-night activity %, population & household density
- Accessibility / parking availability
- **Placement Verdict**: High Priority / Medium / Skip
- Specific micro-areas to prioritize (density × demand)
