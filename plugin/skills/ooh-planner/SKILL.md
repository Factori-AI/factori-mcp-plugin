---
description: "Sizes a billboard/placement spot - daily impressions, peak hours, who passes by, and how well they match your target."
---

# OOH Planner

Evaluate a billboard or OOH placement — daily reach, peak exposure hours, audience demographics, commercial context, and fit for your target audience.

## Usage
`/factori:ooh-planner <billboard_location> [target_description] [radius_km]`

## Examples
- `/factori:ooh-planner "101 Hollywood, Los Angeles"` — who's passing through, volume, and whether the corridor justifies the spend
- `/factori:ooh-planner "Times Square, NYC" "millennials 25-34"` — audience fit for target demographic
- `/factori:ooh-planner "I-285 Spaghetti Junction, Atlanta"` — billboard buy strength assessment

## Instructions

1. Call `get_area_pulse` — morning/daytime/night device counts and POI activity windows.
2. Call `get_visit_trends` — LAST_30_DAYS — weekday vs weekend pattern, trend direction.
3. Call `get_visitor_profile` — actual audience passing the billboard (use this, not residential demographics).
4. Call `get_trade_area` — where audience comes from (commuter corridor or local destination?).
5. Call `get_area_snapshot` — commercial context, nearby POI mix, branded presence.

Synthesize into an OOH Planning Report:
- **Estimated Daily Impressions (Reach)**, **Peak Exposure Hours**
- Weekday vs Weekend pattern, audience demographics
- Commercial context — destination vs pass-through corridor
- **Target Fit** score against described audience
- **Recommendation**: Strong / Acceptable / Poor

> **Terminology:** In OOH context, always refer to visits/visit counts as **impressions** or **reach** — never "visits." Daily visit volume = daily impressions. Visitor profile = audience reached.

## Visualization

After gathering the data, render an inline visual dashboard if the host exposes a chart/visualization tool (e.g. visualize:show_widget on Claude.ai, or any equivalent renderer):
- KPI cards for the headline numbers (scores, counts, rates, the verdict/recommendation).
- Bar/donut charts for distributions (category mix, price tiers, atmosphere, demographics, dayparts).
- Horizontal bars for top-N lists (top brands, top categories, origin hexes, ranked locations).
- Line/area charts for any time series (visit trends, momentum).

Pair every chart with a short written interpretation — never return charts alone. Always attempt to render the widget first — do not fall back without trying. If NO chart tool is available, fall back to clean Markdown tables and state that charts aren't available in this host; never silently drop the visuals.



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

| Failure mode | Phrase to insert |
|---|---|
| No data returned | "[Label]: No data returned for this location. [Conclusion] cannot be drawn — treat other signals as directional only." |
| Low sample | "[Label]: Sample size is low (N=[n]). Figures are indicative, not statistically reliable." |
| Tool error / timeout | "[Label]: Data unavailable — [tool name] did not return results. This block is excluded from scoring." |
| Abnormal distribution | "[Label]: Distribution appears abnormal ([bucket] = 100%). Likely a zero-population or non-residential area — [conclusion] is not meaningful here." |
| Dollar figures present | Append inline: *Note: Income and net-worth figures are directional — use relative comparisons, not absolute values.* |

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
- No page number drawn in the file — viewer renders natively. Do NOT programmatically add any page number text or footer annotation — omit entirely.

**PDF report title:**
- "OOH Planner Report": 28pt bold white, left-aligned, in content flow
- Subtitle "[Location] · [radius] · [date]": 10pt #B3B3B3, below title
- No title in the header band — header is a 2pt mint line at page top only

**PDF page setup (mandatory — apply to every page, every section):**
- Set the document base/default page colour to #121212 before placing any content — this is the root background for every page.
- Fill the ENTIRE page background with #121212 — no white or light areas anywhere.
- Every text box, paragraph area, and content container must have an explicit background fill of #121212 — never transparent or white. Do not rely on the page background to show through.
- All body/paragraph text: #FFFFFF on #121212
- All tables: header row background #252525, alternating body rows #1E1E1E / #2E2E2E, grid borders #333333
- Table header text: #FFFFFF bold; table body text: #B3B3B3
- Evidence section headings: mint #00FFC4
- Sub-headings and labels: #FFFFFF
- Secondary/supporting text: #B3B3B3
- Do not leave any content area, text block, or table with a white or light background
- **No large blank gaps** — content must flow continuously across the entire PDF. Never leave large blank areas at the bottom of any page. Do not insert forced page breaks between sections — let content flow naturally and start a new page only when the current page is full. Maximum gap between any two content blocks: 12pt.
- **PDF KPI card sizing (mandatory):** Minimum card width 1.2 in (86pt). Content area is ~6.3 in wide. Never fit more than 5 cards in one row — if 6 cards are needed use two rows of 3. If cards at minimum width do not all fit in one row, use two rows instead of shrinking. Card height minimum 0.9 in. Never scale down card font sizes to fit more cards per row. Minimum gap between cards: 8pt horizontal AND 8pt vertical between rows. Each card must have minimum 8pt internal padding on all four sides — text must never touch the card edge.
- **Failed charts/sections:** If a chart cannot be rendered, skip both the chart AND its section heading — never leave blank space or an orphaned heading with no content. Continue immediately with the next renderable content block.
- **Chart label clearance:** Chart titles must sit above the chart plotting area with minimum 16pt clearance — no bar, line, or data element may overlap any title, label, or text annotation. Left-side axis labels must have minimum 12pt right-margin before the first bar starts. Value labels at bar ends must not overflow the chart boundary.

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
First sentence only. State estimated daily impressions and Strong / Acceptable / Poor rating in one sentence. No badge. No heading. No emoji.

**Beat 2 — Scorecard**
4–6 KPI cards immediately after the verdict sentence. Each card:
- Label: uppercase, 9–10pt, muted (#6B6B6B)
- Value: 18–24pt, colour-coded (positive → #50B432, caution → #EF9F27, negative → #E34948, primary → #00FFC4)
- Sub-label: 9pt, secondary colour (#B3B3B3)

Standard KPIs for this skill (in order): Est. daily impressions · Peak exposure hours · Weekday avg impressions · Weekend avg impressions · Target fit score

KPI card grid: 5–6 columns, equal width, dark card surface (#1E1E1E), colour-coded top strip (mint #00FFC4 for primary, green #50B432 for positive, amber #EF9F27 for caution, grey for neutral).
Bar charts: mint (#00FFC4) fill, dark track (#2E2E2E), labels in #B3B3B3.

**Beat 3 — Evidence**
One paragraph per tool called, in this fixed order:
1. Daily impressions
2. Peak exposure hours
3. Weekday vs weekend
4. Audience demographics
5. Commercial context
6. Target fit

Format per paragraph: **Bold label** → key number(s) → interpretation → one-line "so what" at the end.

**Beat 4 — Bottom line**
Final paragraph (no heading). Restate impression volume and Strong / Acceptable / Poor, then give the single most important next action. If 3+ evidence blocks used fallback language, add: "Confidence is low — recommend re-running once data is available."
---

### This skill's verdict and evidence blocks

| | |
|---|---|
| **Verdict label** | Est. daily impressions → Strong / Acceptable / Poor |
| **Evidence blocks (in order)** | Daily impressions · Peak exposure hours · Weekday vs weekend · Audience demographics · Commercial context · Target fit |
