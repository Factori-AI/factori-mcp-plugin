---
description: "Plan infrastructure placement (cell towers, EV chargers, ATMs) using foot traffic, time-of-day patterns, and demographics."
---

# Network Planner

Plan infrastructure placement — foot traffic volume, time-of-day demand windows, and demographics identify High Priority / Medium / Skip zones.

## Usage
`/factori:network-planner <metro_area> [infrastructure_type] [radius_km]`

## Examples
- `/factori:network-planner "Atlanta metro"`
- `/factori:network-planner "Brooklyn, NYC" "EV charger" 0.5`
- `/factori:network-planner "Whitefield, Bangalore" "ATM" 1.0`

## Instructions

1. Call `get_area_pulse` — when the area is active (morning/daytime/night), 24hr operation %, late-night activity.
2. Call `get_area_snapshot` — POI density, accessibility, parking.
3. Call `get_demographics_report` — household density, income, education.

Synthesize into a Network Planning Report:
- **Demand Window**: peak hours for infrastructure usage
- 24hr / late-night activity %, population & household density
- Accessibility / parking availability
- **Placement Verdict**: High Priority / Medium / Skip
- Specific micro-areas to prioritize (density × demand)
