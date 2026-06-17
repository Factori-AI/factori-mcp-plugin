---
description: "Estimate how much a proposed store would steal from your existing ones — gravity model, per-store impact, and Go/No-Go/Adjust verdict."
---

# Cannibalization Analysis

Estimate how much a proposed store would steal from your existing ones with a Go/No-Go/Adjust call.

## Usage
`/factori:cannibalization-analysis <proposed_address> <existing_addresses> [competitor_addresses]`

## Examples
- `/factori:cannibalization-analysis "I want to open a new cafe in Santa Monica but I already have shops in Venice and Culver City, so tell me how much of the new store's traffic would just be cannibalized from those two."`
- `/factori:cannibalization-analysis "New store in Williamsburg near my Bushwick and Greenpoint locations — overlap?"`
- `/factori:cannibalization-analysis "Opening in River North Chicago; I have Wicker Park and West Loop"`

## Instructions

1. Split existing_addresses by comma — label each Store 1, Store 2, … with radius_km=0.3.
2. If competitor_addresses provided, build the competitors list the same way.
3. Call `assess_cannibalization_risk`:
   - proposed_site: `{label: "Proposed", address: <proposed_address>, radius_km: 0.3}`
   - existing_network: list from step 1
   - competitors: list from step 2 (omit if empty)
   - time_range: "LAST_30_DAYS"

Synthesize into a Cannibalization Report:
- **Risk Label** (Low / Medium / High)
- Cannibalization rate %, per-store impact
- Competitor capture share, net new visits
- **Recommendation**: Go / No-Go / Adjust radius
