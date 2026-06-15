---
description: "Full business-landscape scan of an area with commercial mix, top brands, ratings, 90-day traffic momentum, and a Vibrant/Stable/Soft climate verdict."
---

# Area Snapshot

Full business landscape analysis for an area — commercial mix, traffic momentum over 90 days, and an overall business climate verdict.

## Usage
`/factori:area-snapshot <location> [radius_km]`

## Examples
- `/factori:area-snapshot "I'm thinking about leasing retail space in Wynwood, Miami and want to understand what kinds of businesses are already clustered there and whether the area is thriving or fading before I commit."`
- `/factori:area-snapshot "Commercial landscape of Deep Ellum, Dallas"`
- `/factori:area-snapshot "Business climate read on Capitol Hill, Seattle"`

## Instructions

1. Call `get_area_snapshot` — total POIs, category distribution, top brands, ratings, hours, accessibility.
2. Call `get_market_quality` — opportunity level + rating saturation.
3. Call `get_visit_trends` — daily, LAST_90_DAYS — area momentum.
4. Call `get_area_pulse` — morning/daytime/night intensity, late-night %, weekday vs weekend pattern.

Synthesize:
- Commercial mix, top 10 brands, quality bar, operational profile
- **Traffic Momentum**: growing / stable / declining
- **Business Climate**: Vibrant / Stable / Soft
