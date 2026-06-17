---
description: "Evaluates the real-world visibility and strategic value of any OOH placement — daily impressions, peak exposure hours, audience demographics, and target fit score."
---

# OOH Planner

Evaluates the real-world visibility and strategic value of any billboard or out-of-home placement. It calculates daily impression volume, identifies peak exposure hours, maps audience demographics, and scores the location's alignment with your specific target campaign criteria.

## Usage
`/factori:ooh-planner <billboard_location> [target_description] [radius_km]`

## Examples
- `/factori:ooh-planner "I'm planning a billboard buy along the 101 through Hollywood and want to know who's passing through, the volume, and whether it's a strong corridor to justify the spend."`
- `/factori:ooh-planner "OOH placement at Times Square, NYC for millennials"`
- `/factori:ooh-planner "Is I-285 at Spaghetti Junction, Atlanta a strong billboard buy?"`

## Instructions

1. Call `get_area_pulse` — morning/daytime/night device counts and POI activity windows.
2. Call `get_visit_trends` — daily, LAST_30_DAYS unless user specifies — weekday vs weekend pattern.
3. Call `get_visitor_profile` — actual audience passing the billboard (use this, not residential demographics).
4. Call `get_trade_area` — where audience comes from (commuter corridor or local destination?).
5. Call `get_area_snapshot` — commercial context, POI mix, and area profile.

Synthesize into an OOH Planning Report:
- **Estimated Daily Impressions**, **Peak Exposure Hours**
- Weekday vs Weekend, audience demographics
- **Target Fit** score
- **Recommendation**: Strong / Acceptable / Poor
