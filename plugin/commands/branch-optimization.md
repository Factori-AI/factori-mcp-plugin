---
description: "Bank branch or facility network audit — ranks branches, identifies consolidation candidates and expansion targets."
---

# Branch Optimization

Audit your branch or facility network — rank performance, identify consolidation candidates, and find expansion targets.

## Usage
`/factori:branch-optimization <branch_addresses>`

Pass branch_addresses as a comma-separated list of 2–10 addresses.

## Examples
- `/factori:branch-optimization "I run three gyms in downtown Houston, The Woodlands, and Sugar Land and want to know which one is underperforming and whether any of them overlap so I can decide what to consolidate."`
- `/factori:branch-optimization "Optimize my coffee shops across Brooklyn, Queens, the Bronx"`
- `/factori:branch-optimization "Rank my branches in Portland: Pearl District, Hawthorne, Alberta"`

## Instructions

1. Split branch_addresses by comma. Call `compare_locations`:
   - locations: each address as `{label: "Branch N", address: "...", radius_km: 0.3}`
   - metrics: ["all"], time_range: "LAST_30_DAYS"
2. Identify **bottom-2 ranked branches**. Call `get_trade_area` for each — small catchments = consolidation candidates.
3. Call `get_market_quality` for each weak branch — check if market is over- or under-served.

Synthesize into a Branch Optimization Report:
- **Branch Scorecard**, consolidation candidates, expansion targets
- Relocation opportunities, priority-ordered recommendations
