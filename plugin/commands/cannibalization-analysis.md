---
description: "Assess cannibalization risk when opening a new store near your existing network — gravity model, per-store impact, and Go/No-Go verdict."
---

# Cannibalization Analysis

Assess how much a new location would steal visits from your own existing stores, and estimate net new visits vs lost visits using a gravity model.

## Usage
`/factori:cannibalization-analysis <proposed_address> <existing_addresses> [competitor_addresses]`

## Examples
- `/factori:cannibalization-analysis "500 Peachtree St, Atlanta" "100 Main St, Atlanta, 200 Broad St, Atlanta"`
- `/factori:cannibalization-analysis "Broadway & 42nd, NYC" "5th Ave Store, NYC" "Competitor Store, NYC"`

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
