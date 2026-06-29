---
description: "Scores a location 1–10 for opening a business across traffic, demographics, catchment, and opportunity, with an Open / Caution / Pass verdict."
---

# Site Selection

Score a location for opening a business — combines area landscape, traffic trends, demographics, visitor audience, trade area, market opportunity, and time-of-day demand into a 1–10 Location Score.

## Usage
`/factori:site-selection <location> [business_type] [radius_km]`

## Examples
- `/factori:site-selection "Fulton Market, Chicago" "coffee shop"` — site score: strong spot or already saturated?
- `/factori:site-selection "Tempe AZ near ASU" "gym"` — evaluate site near university campus
- `/factori:site-selection "Mission District, SF" "restaurant"` — location score with Open/Caution/Pass verdict

## Instructions

Call each tool IN ORDER for the given location:

1. **Area Snapshot** — `get_area_snapshot` — POI mix, top brands, branded vs independent, ratings, parking.
2. **Visit Trends** — `get_visit_trends` — LAST_30_DAYS — visit volume, trend direction, peak/lowest periods.
3. **Demographics** — `get_demographics_report` — residents' income, age, education, housing tenure.
4. **Visitor Profile** — `get_visitor_profile` — WHO actually visits (often differs from residents).
5. **Trade Area** — `get_trade_area` — origin hex distribution and catchment quality.
6. **Market Quality** — `get_market_quality` — opportunity level (High/Medium/Low) and saturation.
7. **Area Pulse** — `get_area_pulse` — time-of-day demand windows and peak activity hours.

Synthesize into a Site Selection Report:
- **Location Score (1–10)** with justification across all pillars
- Traffic Assessment, Demographic Fit, Visitor vs Resident gap
- Trade Area Quality, Market Opportunity, Peak Demand Windows
- **Final Recommendation**: Open / Proceed with Caution / Pass

## Visualization

After gathering the data, render an inline visual dashboard if the host exposes a chart/visualization tool (e.g. visualize:show_widget on Claude.ai, or any equivalent renderer):
- KPI cards for the headline numbers (scores, counts, rates, the verdict/recommendation).
- Bar/donut charts for distributions (category mix, price tiers, atmosphere, demographics, dayparts).
- Horizontal bars for top-N lists (top brands, top categories, origin hexes, ranked locations).
- Line/area charts for any time series (visit trends, momentum).

Pair every chart with a short written interpretation — never return charts alone. If NO chart tool is available, fall back to clean Markdown tables and state that charts aren't available in this host; never silently drop the visuals.

## Response guidance

Read the entire tool output before answering. Parse every field of every result — including large or truncated payloads. If a result was saved to a file because it was too big, extract the needed fields (e.g. with jq); never skip a section (like the category breakdown) just because the data was long.

Answer according to the user's prompt. Lead with what they actually asked (e.g. a leasing decision, operating hours, audience targeting, a Go/No-Go call) and frame every section toward that intent. Surface the parts of the data most relevant to their goal first; don't return a generic, undifferentiated dump.

## Report Format

Read and apply `plugin/shared/output-spec.md` — it defines all formatting rules, beat structure, typography, dashboard/visual spec, PPTX helpers, branding, and the QA checklist. Apply every rule in that spec exactly.

**Scorecard KPIs (Beat 2):** Location score (1–10) · Traffic trend · Opportunity level · Catchment quality · Demographic fit

| | |
|---|---|
| **Verdict label** | Location Score 1–10 → Open / Caution / Pass |
| **Evidence blocks (in order)** | Traffic Assessment · Demographic Fit · Visitor vs Resident gap · Trade Area Quality · Market Opportunity · Peak Demand Windows |
