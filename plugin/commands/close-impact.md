---
description: "Model customer redistribution when a store closes — which remaining stores absorb traffic and what percentage is lost to competitors."
---

# Close Impact

Model what happens to customers when a store closes — how many are absorbed by remaining stores vs lost to competitors.

## Usage
`/factori:close-impact <closing_address> <remaining_addresses>`

## Examples
- `/factori:close-impact "I'm considering shutting down my Midtown Atlanta location and want to know whether those customers would shift to my Buckhead and Decatur stores or just get lost to competitors."`
- `/factori:close-impact "Closing Fremont Seattle — impact on Ballard and Capitol Hill?"`
- `/factori:close-impact "Shut our Plano store; redistribute to Frisco and Allen, TX?"`

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
