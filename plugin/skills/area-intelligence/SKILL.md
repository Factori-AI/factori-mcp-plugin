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

## Report Format

Produce every report in five beats, in this exact order. The beat names are structural guides for the model only — never print them as headings, labels, or dividers in the output.

### Formatting rules (mandatory — apply to every report)

**Structure**
- Five beats flow as continuous content with no section headings, no horizontal rules between beats, and no numbered sections.
- Beat labels (Verdict, Scorecard, Evidence, Bottom line) never appear in the output under any circumstances.

**Verdict presentation**
- The verdict word (Vibrant / Stable / Soft) appears exactly once — in the first sentence of the report, embedded inline in plain prose. Example: "This is a vibrant, high-quality mixed-use corridor with sustained above-baseline foot traffic."
- Never render the verdict as a standalone badge, bold callout, emoji, or coloured label (e.g. no "🟢 VIBRANT —", no "**VIBRANT**", no green pill).

**Typography and text**
- Body text: 10–11pt equivalent (use the host's default body size).
- Evidence labels: bold inline, e.g. **Category Breakdown**.
- KPI values in the scorecard: 18–24pt equivalent (large, prominent).
- KPI labels: 9–10pt, uppercase, muted colour.
- KPI sub-labels: 9pt, secondary colour.
- No all-caps prose anywhere except KPI labels.

**Spacing**
- One blank line between the verdict sentence and the scorecard block.
- One blank line between the scorecard block and the first evidence paragraph.
- One blank line between each evidence paragraph.
- No blank line between the last evidence paragraph and the bottom line.

**Dashboard / inline visual**
- Render the scorecard as an interactive widget (KPI cards + chart).
- KPI card grid: 5–6 columns, equal width, dark card surface (#1E1E1E), colour-coded top strip (mint #00FFC4 for primary, green #50B432 for positive, amber #EF9F27 for caution, grey for neutral).
- Bar charts: mint (#00FFC4) fill, dark track (#2E2E2E), labels in #B3B3B3.
- Traffic sparkline: green (#50B432) above baseline, red (#E34948) below.
- Pulse cards: daytime card highlighted with mint border and tinted bg.
- Font in widget: system sans-serif, matching body weight.

**Omissions (never include)**
- No "Data window: ..." footnote at the end of any report.
- No verdict badge, emoji, or coloured label anywhere.
- No section headings or dividers between beats.
- No caveats, disclaimers, or notes appended to the report.
- No "Download as PDF · PowerPoint · Markdown" prompt in the report body.

---

### Beat 1 — Verdict

First sentence of the report only. Format: "This is a [verdict adjective], [one clause of rationale framed to the user's stated intent]."

One sentence. No badge. No heading. No emoji. Verdict word lowercase and embedded, not isolated.

---

### Beat 2 — Scorecard

4–6 KPI cards immediately after the verdict sentence (no label above). Render as an interactive widget. Each card shows:
- Label: uppercase, 9–10pt, muted
- Value: 18–24pt, colour-coded
- Sub-label: 9pt, secondary colour

Standard KPIs for this skill (in order): Total POIs · Avg rating · 5-star share · Opportunity level · Vulnerable POI % · 90-day traffic change

---

### Beat 3 — Evidence

One paragraph per tool called, in this fixed order:
1. Category Breakdown
2. Top Brands + Branded/Independent Split
3. Quality Bar
4. Operational & Atmosphere
5. Traffic Momentum

Format per paragraph: **Bold label** → key number(s) → interpretation → one-line "so what" at the end.

Every block must appear even when data is missing. Use these exact fallback phrases — never silently omit a block:
- No data returned: "[Label]: No data returned for this location — [conclusion] cannot be drawn. Treat other signals as directional only."
- Low sample: "[Label]: Sample size is low (N=[n]). Figures are indicative, not statistically reliable."
- Tool error: "[Label]: Data unavailable — [tool name] did not return results. This block is excluded from scoring."

---

### Beat 4 — Bottom line

Final paragraph (no heading). Restate the verdict in a sentence, then give the single most important next action.

If 3 or more evidence blocks used fallback language, add inline: "Confidence is low — recommend re-running once data is available."

No data window footnote. No download prompt. End here.

---

### Download

After the bottom line, always end with this exact line:

> **Download this report as:** PDF · PowerPoint — just ask and I'll generate the file.

---

### Branding in downloaded outputs (PDF / PPTX)

Apply these rules exactly for every PDF and PowerPoint output.

**Colour palette (mandatory — use these exact hex values):**

| Token | Hex | Use |
|---|---|---|
| Background | #121212 | Page/slide background |
| Card surface | #1E1E1E / #252525 / #2E2E2E | Elevated surfaces |
| Accent | #00FFC4 | Primary accent — bars, underlines, highlights |
| Border | #333333 / #3A3A3A | Card borders, grid lines |
| Body text | #FFFFFF | Primary text |
| Secondary text | #B3B3B3 | Body / secondary text |
| Muted text | #6B6B6B | Captions, metadata |
| Positive | #50B432 | Positive KPIs |
| Caution | #EF9F27 | Warning KPIs |
| Negative | #E34948 | Negative KPIs |

**PDF footer (every page):**
- Band height: 8mm, background #1E1E1E
- Mint accent line: 1px, at very top of footer band
- Metadata centred: "Data as of [date] · [Location name]", 6.5pt, #6B6B6B
- No page number drawn in the file — viewer renders natively

**PDF report title:**
- "Area Intelligence Report": 28pt bold white, left-aligned, in content flow
- Subtitle "[Location] · [radius] · [date]": 10pt #B3B3B3, below title
- No title in the header band — header is a 2pt mint line at page top only

**PPTX footer (every slide):**
- Band height: 0.26 in, background #1E1E1E
- Mint accent line: 0.015 in, at very top of footer band
- Metadata centred: 7pt, #6B6B6B
- No page number

**PPTX slide heading style:**
- Font: Calibri (or Space Grotesk if available)
- Size: 22pt bold #FFFFFF, left-aligned
- Mint underline accent bar: 0.6 in wide × 0.025 in tall, placed just below the title text, above the subtitle
- Subtitle (if present): 9pt #B3B3B3, below the accent bar
- Content starts below subtitle with adequate clearance (~0.88 in from slide top)

**PPTX layout integrity — check before every export:**
- All text boxes must have sufficient height — never let labels, values, or body text clip at the bottom edge of their container
- Slide titles must be fully visible and must not overlap the mint underline bar or any content below it
- The mint underline bar sits strictly below the title text with no overlap
- All KPI card labels, values, and sub-labels must be fully contained within their card bounds — increase card height if content overflows
- Tables must fit entirely within the slide content area — no row, header, or column must bleed past the slide edge
- Every bar chart label must be fully readable — left-side labels must not be clipped, right value labels must not overflow the slide boundary
- Maintain a minimum 0.1 in clearance between any content element and the slide edge on all four sides
- Content must not extend into the bottom 0.3 in of the slide
- When in doubt, scale content down or reduce font size by 1pt rather than allow any element to overflow or clip
