---
description: "Breaks down an area's daily rhythm — peak hours by morning/day/night, late-night share, and weekday vs weekend patterns."
---

# Area Pulse Analysis

Reveal when an area is busiest — morning vs daytime vs night device counts, late-night activity %, 24/7 operations, and weekday vs weekend pattern.

## Usage
`/factori:area-pulse-analysis <location> [radius_km]`

## Examples
- `/factori:area-pulse-analysis "Bourbon Street, New Orleans"` — when does the area peak and how strong is late-night traffic?
- `/factori:area-pulse-analysis "Las Vegas Strip"` — time-of-day foot traffic breakdown
- `/factori:area-pulse-analysis "6th Street, Austin"` — daypart rhythm analysis

## Instructions

1. Call `get_area_pulse` — morning (06:00–10:00), daytime (10:00–22:00), night (22:00–02:00) device counts; open_after_10pm, open_before_7am, open_24hr.
2. Call `get_visit_trends` — LAST_30_DAYS — weekday vs weekend pattern.

Synthesize:
- **Peak Window**, devices per period, late-night and early-morning activity %
- 24/7 operation share, weekday vs weekend rhythm
- **Operational Recommendation**: best operating hours, staffing windows, late-night opportunity

## Visualization

After gathering the data, render an inline visual dashboard if the host exposes a chart/visualization tool (e.g. visualize:show_widget on Claude.ai, or any equivalent renderer):
- KPI cards for the headline numbers (scores, counts, rates, the verdict/recommendation).
- Bar/donut charts for distributions (category mix, price tiers, atmosphere, demographics, dayparts).
- Horizontal bars for top-N lists (top brands, top categories, origin hexes, ranked locations).
- Line/area charts for any time series (visit trends, momentum).

Pair every chart with a short written interpretation — never return charts alone. If NO chart tool is available, fall back to clean Markdown tables and state that charts aren't available in this host; never silently drop the visuals.

## Response guidance

Read the entire tool output before answering. Parse every field of every result — including large or truncated payloads. If a result was saved to a file because it was too big, extract the needed fields (e.g. with jq); never skip a section (like the category breakdown) just because the data was long.

Answer according to the user's prompt. Lead with what they actually asked (e.g. a leasing decision, operating hours, audience targeting, a Go/No-Go call) and frame every section toward that intent. Surface the parts of the data most relevant to their goal first; don't return a generic, undifferentiated dump.
