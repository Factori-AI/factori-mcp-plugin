---
description: "Models the behavioral fallout of a retail closure — where displaced visitors migrate, % recaptured by remaining network, and % lost to competitors."
---

# Closure Impact Analysis

Models the behavioral fallout of a retail closure. It maps where displaced visitors will migrate, calculates the exact percentage of foot traffic your remaining network can successfully recapture, and projects the visit volume likely to bleed to competitors.

## Usage
`/factori:closure-impact-analysis <closing_address> <remaining_addresses>`

## Examples
- `/factori:closure-impact-analysis "I'm considering shutting down my Midtown Atlanta location and want to know whether those customers would shift to my Buckhead and Decatur stores or just get lost to competitors."`
- `/factori:closure-impact-analysis "Closing Fremont Seattle — impact on Ballard and Capitol Hill?"`
- `/factori:closure-impact-analysis "Shut our Plano store; redistribute to Frisco and Allen, TX?"`

## Instructions

1. Split remaining_addresses by comma — label each Store 1, Store 2, … with radius_km=0.3.
2. Call `analyze_closure_impact`:
   - closing_site: `{label: "Closing", address: <closing_address>, radius_km: 0.3}`
   - remaining_network: list from step 1
   - time_range: "LAST_90_DAYS"

Synthesize into a Closure Impact Report:
- Customers at risk (total visits affected)
- **% retained by remaining network** vs **% lost to competitors**
- Per-store absorption rates, coverage gaps
- **Verdict**: Safe to close / Coverage gap / High customer loss
