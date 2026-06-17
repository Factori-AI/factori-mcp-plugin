---
description: "Delivers a comprehensive diagnostic of a specific area's commercial health — commercial mix, top brands, ratings, traffic momentum, and a Vibrant/Stable/Soft economic health verdict."
---

# Area Intelligence

Delivers a comprehensive diagnostic of a specific area's commercial health. It maps the local brand mix, benchmarks consumer sentiment via ratings, and tracks foot-traffic momentum to issue a definitive economic health verdict: Vibrant, Stable, or Soft.

## Usage
`/factori:area-intelligence <location> [radius_km]`

## Examples
- `/factori:area-intelligence "I'm thinking about leasing retail space in Wynwood, Miami and want to understand what kinds of businesses are already clustered there and whether the area is thriving or fading before I commit."`
- `/factori:area-intelligence "Commercial landscape of Deep Ellum, Dallas"`
- `/factori:area-intelligence "Business climate read on Capitol Hill, Seattle"`

## Instructions

1. Call `get_area_snapshot` — total POIs, category distribution, top brands, price_tier_distribution, performance_metrics, operational_stats, amenities_and_infrastructure, lifestyle_and_atmosphere, crowd_breakdown.
2. Call `get_market_quality` — opportunity level + rating saturation.
3. Call `get_visit_trends` — daily, LAST_90_DAYS unless user specifies — area momentum.
4. Call `get_area_pulse` — morning/daytime/night intensity, late-night %, weekday vs weekend pattern.

Synthesize:
- Commercial mix, top 10 brands, quality bar, operational profile
- **Traffic Momentum**: growing / stable / declining
- **Business Climate**: Vibrant / Stable / Soft
