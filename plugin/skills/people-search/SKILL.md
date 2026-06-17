---
description: Find, count, preview, and unlock B2B and B2C person records — sales leads, marketing audiences, job title lookups, and demographic research.
---

# Factori People Search

Factori's People dataset covers B2B and B2C person records — employment, demographics, interests, contact details, and lifestyle attributes.

## When to use
When the user asks to find, count, or enrich people records — sales leads, marketing audiences, job title lookups, demographic research.

## Workflow (always follow this order)

1. **Resolve filters** — call `resolve_people_filters` with all terms from the user's prompt in one call (job title, skills, company, city, interests, etc.).
2. **Count** — call `get_people_count` with resolved filters + location. Show total, already-unlocked, and new records.
3. **Preview (free)** — call `get_people_preview` if the user wants to browse before spending credits.
4. **Unlock** — call `enrich_people_data` only when user explicitly confirms.
5. **Bulk unlock** — use `bulk_unlock_people` for large batches; check progress with `get_bulk_unlock_progress`.

## Location formats for people
- Admin geo (from resolver): `{city: ["atlanta"], state: ["Georgia"]}`
- Lat/lng + radius (km): `{latitude: "33.74", longitude: "-84.38", radius: "5.0"}`

## Key filter fields
`employee_title`, `skills`, `employee_job_function`, `company_name`, `company_industry`, `interests`, `hobby`, `buyer`, `city`, `state`

## Policies
- Always call `resolve_people_filters` before `get_people_count` — never pass raw text as filter values.
- Never unlock without showing count and getting confirmation.
- People data is sourced per Factori's Privacy Policy and GDPR/CCPA obligations.
