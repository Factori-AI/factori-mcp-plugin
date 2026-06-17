---
description: "Transforms raw location footprint data into actionable marketing assets — audience persona, geofence seed, look-alike seed, and cross-channel activation plan."
---

# Audience Build

Transforms raw location footprint data into actionable marketing assets. It maps visitor behaviors into distinct audience personas, establishes geofences, generates look-alike seed models, and delivers an optimized cross-channel activation plan.

## Usage
`/factori:audience-build <location> [campaign_goal] [radius_km]`

## Examples
- `/factori:audience-build "I want to run an ad campaign targeting people who shop at Mall of America in Minneapolis, so tell me who they are and how I'd actually reach them across DOOH and paid social."`
- `/factori:audience-build "Who visits The Grove in LA and how do I reach them?"`
- `/factori:audience-build "Activation brief for King of Prussia Mall, PA"`

## Instructions

1. Call `get_visitor_profile` — the actual audience that visits.
2. Call `get_trade_area` — origin hex list for geofencing.
3. Call `get_demographics_report` — neighborhood baseline to compare with visitors.

> Note: This analysis does not build the actual audience. Hexes should be reverse geo-coded and people filters resolved to build the audience.

Synthesize into an Activation Brief:
- **Audience Persona**: income, age, education, household, lifestyle
- **Visitor vs Resident gap**
- **Primary trade area** (hexes ≥3% visit fraction) for geofencing
- **Look-alike targeting** seed for paid social / programmatic
- **Recommended channels**: DOOH, mobile geofence, paid social
