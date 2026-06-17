---
description: "Profiles everything operating in an area and rates how healthy it is - what's clustered there, the top categories brands, ratings, price tiers, and traffic momentum, ending in a Vibrant/Stable/Soft verdict."
---

# Area Intelligence

Delivers a comprehensive diagnostic of a specific area's commercial health. It maps the local brand mix, benchmarks consumer sentiment via ratings, and tracks foot-traffic momentum to issue a definitive economic health verdict: Vibrant, Stable, or Soft.

## Usage
`/factori:area-intelligence <location> [radius_km]`

## Examples
- `/factori:area-intelligence "I'm thinking about leasing retail space in Wynwood, Miami and want to understand what kinds of businesses are already clustered there and whether the area is thriving or fading before I commit."`
- `/factori:area-intelligence "Commercial landscape of Deep Ellum, Dallas"`
- `/factori:area-intelligence "Business climate read on Capitol Hill, Seattle"`

## Instructions

### Data collection (call all four, in order)
1. `get_area_snapshot` — total POIs, category_distribution, top brands, branded vs independent, price_tier_distribution, performance_metrics, operational_stats, amenities_and_infrastructure, lifestyle_and_atmosphere, crowd_breakdown.
2. `get_market_quality` — opportunity level (High/Medium/Low) + rating saturation, vulnerable-POI %.
3. `get_visit_trends` — daily, LAST_90_DAYS unless the user specifies another window — area momentum.
4. `get_area_pulse` — morning/daytime/night intensity, late-night %, weekday vs weekend pattern.

> **Large-payload handling:** `get_area_snapshot` can be large and may be truncated/saved to a file. If so, you MUST still extract category_distribution, top_brands, price_tier_distribution, performance_metrics, and lifestyle_and_atmosphere (e.g. via jq). Do not skip the category breakdown because the payload was big — that is the single most common failure of this command.

### Required output (every section is mandatory)

Produce ALL of the following:

- **Headline** — Business Climate verdict (Vibrant / Stable / Soft) + one-line rationale.
- **Category Breakdown** — REQUIRED. From category_distribution: aggregate raw categories into sectors (Food & Drink, Retail, Healthcare, Professional Services, Arts/Nightlife, Personal Care, Real Estate, Transit) with approximate share. List the top 8–15 individual categories by share. State what kind of district this is. Never reply without this section.
- **Top 10 Brands** + branded-vs-independent split.
- **Quality Bar** — avg rating, review volume, % 5-star, vulnerable-POI %, highly-rated %.
- **Operational & Atmosphere Profile** — price-tier mix (value vs premium gap), atmosphere (casual/hip/upscale…), parking, accessibility, hours (open after 10pm / before 7am / 24hr), tourist/crowd signals.
- **Traffic Momentum** — growing / stable / declining, with peak & lowest periods and any seasonality.
- **Business Climate Verdict** — Vibrant / Stable / Soft, justified across momentum + opportunity.

## Visualization

If the host exposes an inline chart/visualization tool (e.g. visualize:show_widget on Claude.ai, or any equivalent renderer), render a dashboard before/with the written report:
- KPI cards — total POIs, avg rating, opportunity level, vulnerable %, tourist draw.
- Category breakdown chart — horizontal bar of sector shares AND/OR top consumer categories.
- Price-tier bar and atmosphere bar.
- 90-day traffic momentum line chart.

If NO chart tool is available, fall back to clean Markdown tables for the same content (do not silently drop the visuals — state that charts aren't available in this host).

## Notes
- Convert relative date windows to absolute in the writeup.
- Dollar-denominated demographic figures can be inflated/directional — rely on relative/share comparisons.
- Tailor the closing read to the user's stated intent (e.g. a leasing decision → fit, seasonality, churn/turnover).

## Response guidance

Read the entire tool output before answering. Parse every field of every result — including large or truncated payloads. If a result was saved to a file because it was too big, extract the needed fields (e.g. with jq); never skip a section (like the category breakdown) just because the data was long.

Answer according to the user's prompt. Lead with what they actually asked (e.g. a leasing decision, operating hours, audience targeting, a Go/No-Go call) and frame every section toward that intent. Surface the parts of the data most relevant to their goal first; don't return a generic, undifferentiated dump.
