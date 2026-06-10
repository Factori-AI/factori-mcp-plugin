---
description: "Bank branch or facility network audit — ranks branches, identifies consolidation candidates and expansion targets."
---

# Branch Optimization

Audit your branch or facility network — rank performance, identify consolidation candidates, and find expansion targets.

## Usage
`/factori:branch-optimization <branch_addresses>`

Pass branch_addresses as a comma-separated list of 2–10 addresses.

## Examples
- `/factori:branch-optimization "100 Peachtree St Atlanta, 200 Broad St Atlanta, 300 Main St Atlanta"`
- `/factori:branch-optimization "Branch A NYC, Branch B NYC, Branch C NYC"`

## Instructions

1. Split branch_addresses by comma. Call `compare_locations`:
   - locations: each address as `{label: "Branch N", address: "...", radius_km: 0.3}`
   - metrics: ["all"], time_range: "LAST_30_DAYS"
2. Identify **bottom-2 ranked branches**. Call `get_trade_area` for each — small catchments = consolidation candidates.
3. Call `get_market_quality` for each weak branch — check if market is over- or under-served.

Synthesize into a Branch Optimization Report:
- **Branch Scorecard**, consolidation candidates, expansion targets
- Relocation opportunities, priority-ordered recommendations
