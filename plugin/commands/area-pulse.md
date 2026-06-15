---
description: "Time-of-day intensity analysis — when does an area peak, late-night activity %, and weekday vs weekend pattern."
---

# Area Pulse

Reveal when an area is busiest — morning vs daytime vs night device counts, late-night activity %, 24/7 operations, and weekday vs weekend pattern.

## Usage
`/factori:area-pulse <location> [radius_km]`

## Examples
- `/factori:area-pulse "I'm deciding the operating hours for a bar on Bourbon Street, New Orleans and want to know when the area actually peaks and how strong late-night traffic is."`
- `/factori:area-pulse "Time-of-day foot traffic for the Las Vegas Strip"`
- `/factori:area-pulse "Daypart rhythm of 6th Street, Austin"`

## Instructions

1. Call `get_area_pulse` — morning (06:00–10:00), daytime (10:00–22:00), night (22:00–02:00) device counts; open_after_10pm, open_before_7am, open_24hr.
2. Call `get_visit_trends` — daily, LAST_30_DAYS — weekday vs weekend pattern.

Synthesize:
- **Peak Window**, devices per period, late-night and early-morning activity %
- 24/7 operation share, weekday vs weekend
- **Operational Recommendation**: best operating hours, staffing windows, late-night opportunity
