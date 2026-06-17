---
description: "Decodes the temporal rhythm of an area — peak hours across morning/daytime/night, late-night activity %, and weekday vs weekend foot-traffic patterns."
---

# Area Pulse Analysis

Decodes the temporal rhythm and behavioral clock of a specific area. It reveals precisely when an area peaks across morning, daytime, and night hours, measures the density of late-night activity, and highlights shifts between weekday and weekend foot-traffic patterns.

## Usage
`/factori:area-pulse-analysis <location> [radius_km]`

## Examples
- `/factori:area-pulse-analysis "I'm deciding the operating hours for a bar on Bourbon Street, New Orleans and want to know when the area actually peaks and how strong late-night traffic is."`
- `/factori:area-pulse-analysis "Time-of-day foot traffic for the Las Vegas Strip"`
- `/factori:area-pulse-analysis "Daypart rhythm of 6th Street, Austin"`

## Instructions

1. Call `get_area_pulse` — morning (06:00–10:00), daytime (10:00–22:00), night (22:00–02:00) device counts; open_after_10pm, open_before_7am, open_24hr.
2. Call `get_visit_trends` — daily, LAST_30_DAYS unless user specifies — weekday vs weekend pattern.

Synthesize:
- **Peak Window**, devices per period, late-night and early-morning activity %
- 24/7 operation share, weekday vs weekend
- **Operational Recommendation**: best operating hours, staffing windows, late-night opportunity
