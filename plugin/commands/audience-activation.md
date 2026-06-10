---
description: "Build an audience persona and activation brief for a location — visitor demographics, trade area origins, and channel recommendations."
---

# Audience Activation

Build a full audience persona and activation brief — who visits, where they come from, and the best channels to reach them.

## Usage
`/factori:audience-activation <location> [campaign_goal] [radius_km]`

## Examples
- `/factori:audience-activation "Lenox Square Mall, Atlanta"`
- `/factori:audience-activation "Times Square, NYC" "brand awareness" 0.5`
- `/factori:audience-activation "Forum Mall, Bangalore" "retargeting" 0.3`

## Instructions

1. Call `get_visitor_profile` — the actual audience that visits.
2. Call `get_trade_area` — origin hex list for geofencing.
3. Call `get_demographics_report` — neighborhood baseline to compare with visitors.

Synthesize into an Activation Brief:
- **Audience Persona**: income, age, education, household, lifestyle
- **Visitor vs Resident gap**
- **Primary trade area** (hexes ≥3% visit fraction) for geofencing
- **Look-alike targeting** seed for paid social / programmatic
- **Recommended channels**: DOOH, mobile geofence, paid social
