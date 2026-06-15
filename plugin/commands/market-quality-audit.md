---
description: "Audit a market's quality and opportunity level — saturation, vulnerable POI %, price tier gaps, Enter/Differentiate/Avoid verdict."
---

# Market Quality Audit

Assess the competitive quality and opportunity level of an area — where is underserved demand and what does the competitive landscape look like?

## Usage
`/factori:market-quality-audit <location> [radius_km]`

## Examples
- `/factori:market-quality-audit "I'm scoping SoHo, NYC for a premium retail concept and want to know whether the market is already saturated or whether there's room for a stronger operator to come in."`
- `/factori:market-quality-audit "Is Old Town Scottsdale saturated or is there room?"`
- `/factori:market-quality-audit "Market quality read on Fishtown, Philadelphia"`

## Instructions

1. Call `get_market_quality` — opportunity level (High/Medium/Low), avg rating, vulnerable POI %, claimed POI %.
2. Call `get_area_snapshot` — POI density, top brands, branded vs independent, price tiers.

Synthesize into a Market Quality Report:
- **Opportunity Level**, saturation read (POI density vs population)
- Quality gap: % vulnerable POIs, branded vs independent mix
- Price tier distribution — premium gap or value gap?
- **Verdict**: Enter / Differentiate / Avoid
