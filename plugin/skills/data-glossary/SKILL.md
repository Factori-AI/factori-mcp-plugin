---
description: Definitions for Factori metrics and terms — mobility, trade area, POI, people, and credits.
---

# Factori Data Glossary

Key terms and metrics used across Factori's tools. Use these definitions when explaining data to users.

## Mobility metrics
- **device_count** — unique mobile devices in an area during a period. One device ≈ one person. Primary foot-traffic proxy.
- **visit_count** — total visit events. One device can generate multiple visits (leave and return). Always ≥ device_count.
- **dwell_time** — how long a device stays per visit. Buckets: 0–15 min (quick), 15–60 min (medium), 1–4 hr (long), 4hr+ (extended).
- **peak_concurrent** — max devices present at the same moment. Indicates busiest instant, not daily total.
- **avg_daily_devices** — average unique devices per day over the time range.

## Trade area terms
- **origin_hex** — an H3 resolution-9 hex (~174m edge, ~0.1 km²) where visitors live. Factori reports the fraction of visitors from each hex.
- **primary catchment** — the set of origin hexes that account for 50% of all visits.
- **secondary catchment** — the set of origin hexes that account for 80% of all visits.
- **home_distribution** — the full map of visitor origins, expressed as hex → visit fraction.

## Place / POI terms
- **vulnerable POI** — a place with a low rating (typically below 3.5). High vulnerable % = quality gap = entry opportunity.
- **claimed POI** — a place where the business owner has verified and manages the listing.
- **opportunity_level** — Factori's market quality signal: High = underserved, Medium = balanced, Low = saturated.
- **branded vs independent** — whether a place belongs to a national/regional chain or is a standalone business.

## People / demographic terms
- **net_worth** — estimated household net worth bracket.
- **household_income** — estimated annual household income bracket.
- **tenure** — whether residents own or rent their home.
- **employee_job_function** — broad department/function (e.g. "Marketing", "Engineering").
- **employee_title** — specific job title (e.g. "Marketing Director").

## Credits
- Credits are consumed when unlocking (enriching) place or people records.
- Previewing records is always free.
- Counting records is always free.
- Check balance with `get_credit_detail` before large unlocks.
