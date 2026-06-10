---
description: "Audit a market's quality and opportunity level — saturation, vulnerable POI %, price tier gaps, Enter/Differentiate/Avoid verdict."
---

# Market Quality Audit

Assess the competitive quality and opportunity level of an area — where is underserved demand and what does the competitive landscape look like?

## Usage
`/factori:market-quality-audit <location> [radius_km]`

## Examples
- `/factori:market-quality-audit "Midtown Atlanta"`
- `/factori:market-quality-audit "SoHo, NYC" 0.5`
- `/factori:market-quality-audit "Indiranagar, Bangalore" 1.0`

## Instructions

1. Call `get_market_quality` — opportunity level (High/Medium/Low), avg rating, vulnerable POI %, claimed POI %.
2. Call `get_area_snapshot` — POI density, top brands, branded vs independent, price tiers.
3. Call `get_demographics_report` — buying-power context.

Synthesize into a Market Quality Report:
- **Opportunity Level**, saturation read (POI density vs population)
- Quality gap: % vulnerable POIs, branded vs independent mix
- Price tier distribution — premium gap or value gap?
- **Verdict**: Enter / Differentiate / Avoid
