---
description: "Investment due-diligence brief for a property — area fundamentals, traffic momentum, audience quality, Buy/Watch/Pass recommendation."
---

# Investor Due Diligence

Full investment due-diligence brief for a property — area fundamentals, 90-day traffic momentum, catchment quality, and Buy/Watch/Pass recommendation.

## Usage
`/factori:investor-due-diligence <property_address> [property_type] [radius_km]`

## Examples
- `/factori:investor-due-diligence "123 Peachtree St, Atlanta"`
- `/factori:investor-due-diligence "450 Park Ave, NYC" "mixed-use" 0.5`
- `/factori:investor-due-diligence "Brigade Road, Bangalore" "retail" 1.0`

## Instructions

1. Call `get_area_snapshot` — commercial density, top brands, price tiers, ratings.
2. Call `get_demographics_report` — population, income, education, housing tenure, avg home value.
3. Call `get_visit_trends` — daily, LAST_90_DAYS — 90-day traffic momentum.
4. Call `get_trade_area` — catchment size and visitor profile.
5. Call `get_market_quality` — opportunity_level and saturation.

Synthesize into an Investment DD Brief:
- **Investment Score (1–10)**, area fundamentals, demographic strength
- **Traffic Momentum**: appreciating / stable / softening
- Catchment quality, market opportunity, risks
- **Recommendation**: Buy / Watch / Pass
