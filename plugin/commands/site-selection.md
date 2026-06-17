---
description: "Score a location 1–10 for opening a business — traffic, demographics, trade area, and market opportunity with an Open/Caution/Pass verdict."
---

# Site Selection

Score a location for opening a business — combines area landscape, traffic trends, demographics, visitor audience, trade area, and market opportunity into a 1–10 Location Score.

## Usage
`/factori:site-selection <location> [business_type] [radius_km]`

## Examples
- `/factori:site-selection "I want to open a coffee shop in Fulton Market, Chicago and need a site-selection score telling me whether it's a strong spot or already too saturated."`
- `/factori:site-selection "Site selection for a gym in Tempe near ASU"`
- `/factori:site-selection "Evaluate a restaurant site in the Mission District, SF"`

## Instructions

Call each tool IN ORDER for the given location:

1. **Area Snapshot** — `get_area_snapshot` — POI mix, top brands, branded vs independent, ratings, parking.
2. **Visit Trends** — `get_visit_trends` — daily, LAST_30_DAYS unless user specifies — visit volume, trend direction, peak/lowest periods.
3. **Demographics** — `get_demographics_report` — residents' income, age, education, housing.
4. **Visitor Profile** — `get_visitor_profile` — WHO actually visits (often differs from residents).
5. **Trade Area** — `get_trade_area` — radius_km=0.3 — origin hex distribution and catchment quality.
6. **Market Quality** — `get_market_quality` — opportunity level (High/Medium/Low) and saturation.
7. **Area Pulse** — `get_area_pulse` — time-of-day intensity, late-night %, weekday vs weekend pattern.

Synthesize into a Site Selection Report:
- **Location Score (1–10)** with justification
- Traffic Assessment, Demographic Fit, Visitor vs Resident gap
- Trade Area Quality, Market Opportunity
- **Final Recommendation**: Open / Proceed with Caution / Pass

> Note: No dedicated Site Scoring API exists — the score is derived from synthesizing the above data.
