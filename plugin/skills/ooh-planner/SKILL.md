---
description: "Sizes a billboard/placement spot - daily impressions, peak hours, who passes by, and how well they match your target."
---

# OOH Planner

Evaluate a billboard or OOH placement — daily reach, peak exposure hours, audience demographics, commercial context, and fit for your target audience.

## Usage
`/factori:ooh-planner <billboard_location> [target_description] [radius_km]`

## Examples
- `/factori:ooh-planner "101 Hollywood, Los Angeles"` — who's passing through, volume, and whether the corridor justifies the spend
- `/factori:ooh-planner "Times Square, NYC" "millennials 25-34"` — audience fit for target demographic
- `/factori:ooh-planner "I-285 Spaghetti Junction, Atlanta"` — billboard buy strength assessment

## Instructions

1. Call `get_area_pulse` — morning/daytime/night device counts and POI activity windows.
2. Call `get_visit_trends` — LAST_30_DAYS — weekday vs weekend pattern, trend direction.
3. Call `get_visitor_profile` — actual audience passing the billboard (use this, not residential demographics).
4. Call `get_trade_area` — where audience comes from (commuter corridor or local destination?).
5. Call `get_area_snapshot` — commercial context, nearby POI mix, branded presence.

Synthesize into an OOH Planning Report:
- **Estimated Daily Impressions**, **Peak Exposure Hours**
- Weekday vs Weekend pattern, audience demographics
- Commercial context — destination vs pass-through corridor
- **Target Fit** score against described audience
- **Recommendation**: Strong / Acceptable / Poor

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
