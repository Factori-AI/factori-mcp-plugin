---
description: "Complete site selection analysis — Location Score 1–10 with traffic, demographics, trade area, and market opportunity."
---

# Site Selection Report

Score a location for opening a business — combines area landscape, traffic trends, demographics, visitor audience, trade area, and market opportunity into a 1–10 Location Score.

## Usage
`/factori:site-selection-report <location> [business_type] [radius_km]`

## Examples
- `/factori:site-selection-report "123 Main St, Atlanta"`
- `/factori:site-selection-report "Times Square, NYC" "restaurant" 0.5`
- `/factori:site-selection-report "MG Road, Bangalore" "retail store" 1.0`

## Instructions

Call each tool IN ORDER for the given location:

1. **Area Snapshot** — `get_area_snapshot` — POI mix, top brands, branded vs independent, ratings, parking.
2. **Visit Trends** — `get_visit_trends` — daily, LAST_30_DAYS — visit volume, trend direction, peak/lowest periods.
3. **Demographics** — `get_demographics_report` — residents' income, age, education, housing.
4. **Visitor Profile** — `get_visitor_profile` — WHO actually visits (often differs from residents).
5. **Trade Area** — `get_trade_area` — radius_km=0.3 — origin hex distribution and catchment quality.
6. **Market Quality** — `get_market_quality` — opportunity level (High/Medium/Low) and saturation.

Synthesize into a Site Selection Report:
- **Location Score (1–10)** with justification
- Traffic Assessment, Demographic Fit, Visitor vs Resident gap
- Trade Area Quality, Market Opportunity
- **Final Recommendation**: Open / Proceed with Caution / Pass
