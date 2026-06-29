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

Always attempt to render the widget first — do not fall back without trying. If NO chart tool is available, fall back to clean Markdown tables for the same content (do not silently drop the visuals — state that charts aren't available in this host).



## Notes

- Convert relative date windows to absolute in the writeup.
- Dollar-denominated demographic figures can be inflated/directional — rely on relative/share comparisons.
- Tailor the closing read to the user's stated intent (e.g. a leasing decision → fit, seasonality, churn/turnover).

## Response guidance

Read the entire tool output before answering. Parse every field of every result — including large or truncated payloads. If a result was saved to a file because it was too big, extract the needed fields (e.g. with jq); never skip a section (like the category breakdown) just because the data was long.

Answer according to the user's prompt. Lead with what they actually asked (e.g. a leasing decision, operating hours, audience targeting, a Go/No-Go call) and frame every section toward that intent. Surface the parts of the data most relevant to their goal first; don't return a generic, undifferentiated dump.

## Report Format

Produce every report in **five beats, in this exact order**.

Beats 1 (Verdict) and 2 (Scorecard) are rendered by the `visualize:show_widget` call — **do not repeat them as text below the widget**. Do not write an intro sentence before the Evidence section.

### 1. Verdict

Rendered by the widget: verdict label badge + one sentence of rationale.

### 2. Scorecard

Rendered by the widget: 4–6 KPI cards + charts.

### 3. Evidence

Output with exactly this heading: `### Evidence`
One block per tool called, in the fixed order listed below. Format: **Bold label** → number(s) → one-line "so what." Every block must appear even when data is missing — use the fallback phrases below, never silently omit a block.

### 4. Bottom line

Output with exactly this heading: `### Bottom line`
Verdict restated + single most important next action. If 3+ evidence blocks used fallback language, flag as low-confidence and recommend re-running.

---

### Fallback language (mandatory)

| Failure mode           | Phrase to insert                                                                                                                                    |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| No data returned       | "[Label]: No data returned for this location. [Conclusion] cannot be drawn — treat other signals as directional only."                              |
| Low sample             | "[Label]: Sample size is low (N=[n]). Figures are indicative, not statistically reliable."                                                          |
| Tool error / timeout   | "[Label]: Data unavailable — [tool name] did not return results. This block is excluded from scoring."                                              |
| Abnormal distribution  | "[Label]: Distribution appears abnormal ([bucket] = 100%). Likely a zero-population or non-residential area — [conclusion] is not meaningful here." |
| Dollar figures present | Append inline: _Note: Income and net-worth figures are directional — use relative comparisons, not absolute values._                                |

---

### Cross-cutting rules

- **Verdict first.** Decision is the headline, not the conclusion.
- **Every claim cites a number.**
- **Absolute dates.** Convert relative windows (LAST_30_DAYS etc.) to absolute dates in the writeup.
- **Dollars are directional.** Prefer relative/share comparisons over absolute values.
- **Tailor to intent.** Surface data most relevant to the user's goal first.
- **Visuals never stand alone.** Every chart gets a one-line interpretation. If no chart tool, fall back to Markdown tables.
- **3+ fallback blocks = low-confidence verdict.** Flag explicitly and recommend re-running.

---

### Download options

After every report, offer: **Download as: PDF · PowerPoint** — just ask and I'll generate the file.

File naming: `factori-[skill-name]-[sanitised-location]-[YYYY-MM-DD]` (append `-2`, `-3` if filename exists).

- **PDF** — generate a styled PDF using the branding rules below. Save to `/mnt/user-data/outputs/[filename].pdf`.
- **PowerPoint** — generate a PPTX using the branding rules below. Slides: Cover → Scorecard → one slide per evidence block → Bottom line. Save to `/mnt/user-data/outputs/[filename].pptx`.

---

### Branding for downloaded outputs (PDF / PPTX)

Apply these rules exactly for every PDF and PowerPoint output.

**Colour palette (mandatory — use these exact hex values):**

| Token          | Hex                         | Use                                           |
| -------------- | --------------------------- | --------------------------------------------- |
| Background     | #121212                     | Page/slide background                         |
| Card surface   | #1E1E1E / #252525 / #2E2E2E | Elevated surfaces                             |
| Accent         | #00FFC4                     | Primary accent — bars, underlines, highlights |
| Border         | #333333 / #3A3A3A           | Card borders, grid lines                      |
| Body text      | #FFFFFF                     | Primary text                                  |
| Secondary text | #B3B3B3                     | Body / secondary text                         |
| Muted text     | #6B6B6B                     | Captions, metadata                            |
| Positive       | #50B432                     | Positive KPIs                                 |
| Caution        | #EF9F27                     | Warning KPIs                                  |
| Negative       | #E34948                     | Negative KPIs                                 |

**PDF footer (every page):**

- Band height: 8mm, background #1E1E1E
- Mint accent line: 1px, at very top of footer band
- Metadata centred: "Data as of [date] · [Location name]", 6.5pt, #6B6B6B
- No page number drawn in the file — viewer renders natively

**PDF report title:**

- "Area Intelligence Report": 28pt bold white, left-aligned, in content flow
- Subtitle "[Location] · [radius] · [date]": 10pt #B3B3B3, below title
- No title in the header band — header is a 2pt mint line at page top only

**PDF page setup (mandatory — apply to every page, every section):**
- Fill the ENTIRE page background with #121212 — no white or light areas anywhere
- All body/paragraph text: #FFFFFF on #121212
- All tables: header row background #252525, alternating body rows #1E1E1E / #2E2E2E, grid borders #333333
- Table header text: #FFFFFF bold; table body text: #B3B3B3
- Evidence section headings: mint #00FFC4
- Sub-headings and labels: #FFFFFF
- Secondary/supporting text: #B3B3B3
- Do not leave any content area, text block, or table with a white or light background
- **No large blank gaps** — content must flow continuously across the entire PDF. Never leave large blank areas at the bottom of any page. Do not insert forced page breaks between sections — let content flow naturally and start a new page only when the current page is full. Maximum gap between any two content blocks: 12pt.

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
- **KPI cards must never overlap each other.** Calculate the total width of all cards before rendering — if they don't fit in one row, use two rows.
- **Text-based KPI values** (e.g. "10am–10pm", "Commuter") must use a smaller font (14–16pt max) and wrap within the card — never overflow into adjacent cards.
- **Numeric KPI values** may use 18–24pt but must still be clipped to their card boundary.
- Minimum horizontal gap between cards: 8pt. Never reduce this gap to fit more cards — use two rows instead.
- Tables must fit entirely within the slide content area — no row, header, or column must bleed past the slide edge
- Every bar chart label must be fully readable — left-side labels must not be clipped, right value labels must not overflow the slide boundary
- Maintain a minimum 0.1 in clearance between any content element and the slide edge on all four sides
- Content must not extend into the bottom 0.3 in of the slide
- When in doubt, scale content down or reduce font size by 1pt rather than allow any element to overflow or clip

**PDF/PPTX content structure — follow these beats for every downloaded output:**

**Beat 1 — Verdict**
First sentence only. State the Business Climate verdict (Vibrant / Stable / Soft) and the key metric that justifies it in one sentence. No badge. No heading. No emoji.

**Beat 2 — Scorecard**
4–6 KPI cards immediately after the verdict sentence. Each card:

- Label: uppercase, 9–10pt, muted (#6B6B6B)
- Value: 18–24pt, colour-coded (positive → #50B432, caution → #EF9F27, negative → #E34948, primary → #00FFC4)
- Sub-label: 9pt, secondary colour (#B3B3B3)

Standard KPIs for this skill (in order): Total POIs · Avg rating · Opportunity level · Vulnerable POI % · Tourist/crowd draw

KPI card grid: 5–6 columns, equal width, dark card surface (#1E1E1E), colour-coded top strip (mint #00FFC4 for primary, green #50B432 for positive, amber #EF9F27 for caution, grey for neutral).
Bar charts: mint (#00FFC4) fill, dark track (#2E2E2E), labels in #B3B3B3.

**Beat 3 — Evidence**
One paragraph per tool called, in this fixed order:

1. Category Breakdown
2. Top 10 Brands + branded/independent split
3. Quality Bar (ratings)
4. Operational & Atmosphere Profile
5. Traffic Momentum

Format per paragraph: **Bold label** → key number(s) → interpretation → one-line "so what" at the end.

**Beat 4 — Bottom line**
Final paragraph (no heading). Restate the Business Climate verdict and single most important finding, then give one next action. If 3+ evidence blocks used fallback language, add: "Confidence is low — recommend re-running once data is available."

---

### This skill's verdict and evidence blocks

|                                |                                                                                                                                |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------ |
| **Verdict label**              | Vibrant / Stable / Soft                                                                                                        |
| **Evidence blocks (in order)** | Category Breakdown · Top 10 Brands + branded/independent · Quality Bar (ratings) · Operational & Atmosphere · Traffic Momentum |
