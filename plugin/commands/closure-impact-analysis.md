---
description: "Model customer redistribution when a store closes — which remaining stores absorb traffic and what percentage is lost to competitors."
---

# Closure Impact Analysis

Model what happens to customers when a store closes — how many are absorbed by remaining stores vs lost to competitors.

## Usage
`/factori:closure-impact-analysis <closing_address> <remaining_addresses>`

## Examples
- `/factori:closure-impact-analysis "100 Main St, Atlanta" "200 Broad St, Atlanta, 300 Peachtree St, Atlanta"`
- `/factori:closure-impact-analysis "5th Ave Store, NYC" "Broadway Store, NYC"`

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
