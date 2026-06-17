---
description: "Evaluates a market's health and investment potential — saturation, vulnerable POI %, price tier gaps, Enter/Differentiate/Avoid verdict."
---

# Market Quality

Evaluates a market's health and investment potential by uncovering hidden gaps and saturation risks. It audits local business ratings, calculates the percentage of vulnerable points-of-interest, and maps premium-versus-discount price tier gaps to identify exactly where demand remains unserved.

## Usage
`/factori:market-quality <location> [radius_km]`

## Examples
- `/factori:market-quality "I'm scoping SoHo, NYC for a premium retail concept and want to know whether the market is already saturated or whether there's room for a stronger operator to come in."`
- `/factori:market-quality "Is Old Town Scottsdale saturated or is there room for a new business? Specifically, how many points of interest (POIs) in the area are top-rated by consumers?"`
- `/factori:market-quality "Market quality read on Fishtown, Philadelphia"`

## Instructions

1. Call `get_market_quality` — opportunity level (High/Medium/Low), avg rating, vulnerable POI %, claimed POI %.
2. Call `get_area_snapshot` — POI density, top brands, branded vs independent, price tiers.

Synthesize into a Market Quality Report:
- **Opportunity Level**, saturation read (POI density vs population)
- Quality gap: % vulnerable POIs, branded vs independent mix
- Price tier distribution — premium gap or value gap?
- **Verdict**: Enter / Differentiate / Avoid
