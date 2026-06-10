---
description: "Time-of-day intensity analysis — when does an area peak, late-night activity %, and weekday vs weekend pattern."
---

# Time-of-Day Analysis

Reveal when an area is busiest — morning vs daytime vs night device counts, late-night activity %, 24/7 operations, and weekday vs weekend pattern.

## Usage
`/factori:time-of-day-analysis <location> [radius_km]`

## Examples
- `/factori:time-of-day-analysis "Buckhead, Atlanta"`
- `/factori:time-of-day-analysis "Lower East Side, NYC" 0.5`
- `/factori:time-of-day-analysis "Koramangala, Bangalore" 0.3`

## Instructions

1. Call `get_area_pulse` — morning (06:00–10:00), daytime (10:00–22:00), night (22:00–02:00) device counts; open_after_10pm, open_before_7am, open_24hr.
2. Call `get_visit_trends` — daily, LAST_30_DAYS — weekday vs weekend pattern.

Synthesize:
- **Peak Window**, devices per period, late-night and early-morning activity %
- 24/7 operation share, weekday vs weekend
- **Operational Recommendation**: best operating hours, staffing windows, late-night opportunity
