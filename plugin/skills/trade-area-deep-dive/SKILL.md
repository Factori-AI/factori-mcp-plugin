---
description: "Maps a location's catchment and audience — visit volume, demographics, time-of-day patterns, and where visitors travel from."
---

# Trade Area Deep Dive

Comprehensive trade area analysis — where visitors come from, who they are, when they visit, and the commercial context of the location.

## Usage
`/factori:trade-area-deep-dive <location> [radius_km]`

## Examples
- `/factori:trade-area-deep-dive "Galleria Mall, Houston"` — where shoppers come from and who they are for catchment strategy
- `/factori:trade-area-deep-dive "Pike Place Market, Seattle"` — visitor origins and audience profile
- `/factori:trade-area-deep-dive "Disney Springs, Orlando"` — full catchment analysis

## Instructions

1. Call `get_trade_area` — origin hex list, coverage quality, visitor demographic and economic profile.
2. Call `get_area_pulse` — morning/daytime/night device counts, time-of-day visit pattern.
3. Call `get_area_snapshot` — commercial context, POI mix, top brands, ratings.

Synthesize into a Trade Area Report:
- Top origin hexes by visit fraction, primary (50%) and secondary (80%) catchment breakdown
- Visitor demographic profile (age, income, net worth, household)
- Time-of-day visit pattern, peak windows
- Commercial context and area profile
- Draw Type: hyper-local / commuter / regional

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

Produce every report in **five beats, in this exact order**. Lead with the verdict — never bury it under data.

### 1. Verdict
First line of the report. Skill verdict label (see below) + one sentence of rationale framed to the user's stated intent.

### 2. Scorecard
4–6 headline KPI cards (or a Markdown table) that quantify the verdict.

### 3. Evidence
One block per tool called, in the fixed order listed below. Format: **Bold label** → number(s) → one-line "so what." Every block must appear even when data is missing — use the fallback phrases below, never silently omit a block.

### 4. Bottom line
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

After every report, offer: **Download as: PDF · PowerPoint · Markdown**

File naming: `factori-[skill-name]-[sanitised-location]-[YYYY-MM-DD]` (append `-2`, `-3` if filename exists).

- **PDF** — follow the `pdf` skill. Save to `/mnt/user-data/outputs/[filename].pdf`.
- **PowerPoint** — follow the `pptx` skill (pptxgenjs). Slides: Cover → Scorecard → one slide per evidence block → Bottom line. Palette: Ocean Gradient (`065A82` primary, `1C7293` secondary, `21295C` dark). Fallback blocks in amber (`EF9F27`). Save to `/mnt/user-data/outputs/[filename].pptx`.
- **Markdown** — five beats as structured Markdown. Save to `/mnt/user-data/outputs/[filename].md`.

---

### This skill's verdict and evidence blocks

| | |
|---|---|
| **Verdict label** | Draw type: hyper-local / commuter / regional |
| **Evidence blocks (in order)** | Top origin hexes · Primary (50%) & secondary (80%) catchment · Visitor demographics · Time-of-day pattern · Commercial context |
