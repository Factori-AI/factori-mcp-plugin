---
description: "Find under-served healthcare zones where demographics suggest demand but supply is thin or low quality."
---

# Healthcare Desert Finder

Find healthcare facility deserts — zones where demographics signal high demand but current supply is thin or low quality.

## Usage

`/factori:healthcare-desert-finder <area> [facility_type] [radius_km]`

## Examples

- `/factori:healthcare-desert-finder "South Atlanta"`
- `/factori:healthcare-desert-finder "Bronx, NYC" "urgent care" 2.0`
- `/factori:healthcare-desert-finder "Dharavi, Mumbai" "pharmacy" 1.5`

## Instructions

1. Call `get_demographics_report` — population density, age distribution, income, housing tenure.
2. Call `get_area_snapshot` — current facility supply (POI count, brands, ratings, hours).
3. Call `get_market_quality` — opportunity_level + vulnerable POI %.

Synthesize into a Healthcare Desert Report:

- Population served, aging segment %, current supply count
- Quality gap: % vulnerable POIs, late-night/early-morning availability
- **Desert Verdict**: Severe / Moderate / Saturated
- Priority neighborhoods for new facility placement
