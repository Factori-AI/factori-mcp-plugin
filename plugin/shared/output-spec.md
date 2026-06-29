# Factori Shared Output Specification

This file defines formatting rules, beat structure, typography, PPTX helpers, branding, and layout rules shared across all Factori skills. Every skill references this file — skill-specific scorecard KPIs and verdict/evidence blocks are listed in each skill's own SKILL.md.

---

## Report Format

Produce every report in five beats, in this exact order. The beat names are structural guides for the model only — never print them as headings, labels, or dividers in the output.

---

### Formatting rules (mandatory — apply to every report)

**Structure**
- Five beats flow as continuous content with no section headings, no horizontal rules between beats, and no numbered sections.
- Beat labels (Verdict, Scorecard, Evidence, Bottom line) never appear in the output under any circumstances.

**Verdict presentation**
- The verdict word (Vibrant / Stable / Soft / Open / Enter / Go etc.) appears exactly once — in the first sentence of the report, embedded inline in plain prose.
  Example: "This is a vibrant, high-quality corridor with sustained above-baseline traffic."
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
- Traffic sparkline: green (#50B432) above baseline, red (#E34948) below baseline.
- Pulse cards: daytime card highlighted with mint border and tinted bg.
- Font in widget: system sans-serif, matching body weight.

**Omissions (never include)**
- No "Data window: ..." footnote at the end of any report.
- No verdict badge, emoji, or coloured label anywhere.
- No section headings or dividers between beats.
- No "Download as PDF · PowerPoint · Markdown" prompt unless the user explicitly asks for a download.

---

### Beat 1 — Verdict

First sentence of the report only. Format:
"This is a [verdict adjective], [one clause of rationale framed to the user's stated intent]."

One sentence. No badge. No heading. No emoji. Verdict word lowercase and embedded, not isolated.

---

### Beat 2 — Scorecard

4–6 KPI cards immediately after the verdict sentence (no label above). Render as an interactive widget. Each card shows:
- Label: uppercase, 9–10pt, muted
- Value: 18–24pt, colour-coded
- Sub-label: 9pt, secondary colour

Skill-specific KPIs are listed in each SKILL.md.

---

### Beat 3 — Evidence

One paragraph per tool called, in the fixed order listed in each SKILL.md.

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

### Fallback language (mandatory)

| Failure mode | Phrase to insert |
|---|---|
| No data returned | "[Label]: No data returned for this location — [conclusion] cannot be drawn. Treat other signals as directional only." |
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

Only offer downloads when the user explicitly asks for one.

File naming: `factori-[skill-name]-[sanitised-location]-[YYYY-MM-DD]` (append `-2`, `-3` if filename exists).

- **PDF** — follow the `pdf` skill. Save to `/mnt/user-data/outputs/[filename].pdf`.
- **PowerPoint** — follow the `pptx` skill (pptxgenjs). See PPTX spec below. Save to `/mnt/user-data/outputs/[filename].pptx`.
- **Markdown** — five beats as structured Markdown. Save to `/mnt/user-data/outputs/[filename].md`.

---

## Branding in Downloaded Outputs (PDF / PPTX)

### Colour palette

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
| Caution | #EF9F27 | Warning KPIs, fallback blocks |
| Negative | #E34948 | Negative KPIs |

### PDF footer layout (every page)

- Band height: 8mm, background #1E1E1E
- Mint accent line: 1px, at very top of footer band
- Metadata centred: "Data as of [date] · [Location name]", 6.5pt, #6B6B6B
- No page number drawn in the file — viewer renders natively

### PDF report title

- "[Skill Name] Report": 28pt bold white, left-aligned, in content flow
- Subtitle "[Location] · [radius] · [date]": 10pt #B3B3B3, below title
- No title in the header band — header is a 2pt mint line at page top only

---

## Shared Output Spec — PowerPoint (PPTX)

### Branding rules

- No logo, wordmark, or footer band on any slide.
- Colour palette: use the same tokens defined in the Colour palette table in the Branding section above.

### Canvas

- Slide size: 10 × 5.625 inches (16:9 widescreen)
- Background: #121212 on every slide — no exceptions
- Font: Calibri throughout
- Left/right margin (MX): 0.4 in · Top margin (MY): 0.3 in
- Slide height constant (H): 5.625 in · Slide width constant (W): 10 in

### Slide heading style (all content slides)

- Title: 22pt bold white, left-aligned
  `x: MX, y: MY + 0.02, w: W - 2*MX - 1.6, h: 0.46`
- Mint underline bar: 0.6 in wide × 0.025 in tall
  `x: MX, y: MY + 0.5` — always below title, never overlapping it
- Subtitle (optional): 9pt #B3B3B3
  `x: MX, y: MY + 0.56, w: W - 2*MX, h: 0.22`
- Content starts at y ≈ 0.88 in (with subtitle) or 0.84 in (without)

### Verdict presentation rules (all slides)

- **Never** render a verdict word (Vibrant / Stable / Soft / Go / No-Go etc.) as a badge, coloured pill, or standalone bold label anywhere in the deck.
- The verdict word appears once, inline in plain prose, in the first content sentence of the cover slide.
- Format: "[Verdict adjective], [one clause of rationale]."
- Sentence rendered in 11pt #B3B3B3, placed below the location pill on the cover slide.

### Layout integrity — check before every export

- All text boxes must have sufficient height — never let labels, values, or body text clip at the bottom edge of their container.
- Slide titles must be fully visible and must not overlap the mint underline bar or any content below it.
- The mint underline bar sits strictly below the title text with no overlap.
- All KPI card labels, values, and sub-labels must be fully contained within their card bounds — increase card height if content overflows.
- Tables must fit entirely within the slide content area — no row, header, or column must bleed past the slide edge.
- Every bar chart label must be fully readable — left-side labels must not be clipped, right-side value labels must not overflow the slide boundary.
- Maintain a minimum 0.1 in clearance between any content element and the slide edge on all four sides.
- Content must not extend into the bottom 0.3 in of the slide.
- When in doubt, scale content down or reduce font size by 1pt rather than allow any element to overflow or clip.

### Global omissions (never include in any slide)

- No verdict badge, coloured pill, emoji, or icon for the verdict word
- No "Data window: ..." footnote on any slide
- No section heading labels as slide text ("Verdict", "Scorecard", "Evidence", "Bottom line")
- No accent stripes along slide edges or content block sides (mint underline under the title heading is the only accent line allowed)
- No page numbers drawn in the file — viewer renders natively
- No decorative header band across the top of content slides

---

### KPI card style

```js
function kpiCard(slide, x, y, w, h, label, value, sub, accentColour) {
  // Dark card
  slide.addShape(pres.shapes.ROUNDED_RECTANGLE, {
    x, y, w, h,
    fill: { color: "1E1E1E" },
    line: { color: "333333", width: 0.5 },
    rectRadius: 0.06,
  });
  // Colour top strip
  slide.addShape(pres.shapes.ROUNDED_RECTANGLE, {
    x, y, w, h: 0.055,
    fill: { color: accentColour }, line: { color: accentColour }, rectRadius: 0.04,
  });
  // Label
  slide.addText(label.toUpperCase(), {
    x, y: y + 0.07, w, h: 0.2,
    fontSize: 6.5, fontFace: FONT, bold: true,
    color: "6B6B6B", align: "center", margin: 0,
  });
  // Value
  slide.addText(value, {
    x, y: y + 0.25, w, h: 0.48,
    fontSize: 26, fontFace: FONT, bold: true,
    color: accentColour, align: "center", margin: 0,
  });
  // Sub-label
  slide.addText(sub, {
    x, y: y + h - 0.22, w, h: 0.2,
    fontSize: 7, fontFace: FONT,
    color: "6B6B6B", align: "center", margin: 0,
  });
}
```

### Horizontal bar chart style

```js
function hbar(slide, x, y, w, h, data, colour) {
  const rowH = h / data.length;
  const LW = 1.65, gap = 0.08, valW = 0.42;
  const barW = w - LW - gap - valW;
  const maxVal = Math.max(...data.map(d => d[1]));
  data.forEach(([label, val], i) => {
    const ry = y + i * rowH + rowH * 0.18;
    const bh = rowH * 0.58;
    // Label
    slide.addText(label, {
      x, y: ry, w: LW, h: bh,
      fontSize: 9, fontFace: FONT, color: "B3B3B3",
      align: "right", valign: "middle", margin: 0,
    });
    // Track
    slide.addShape(pres.shapes.ROUNDED_RECTANGLE, {
      x: x + LW + gap, y: ry + bh * 0.28, w: barW, h: bh * 0.44,
      fill: { color: "252525" }, line: { color: "333333", width: 0.3 },
      rectRadius: 0.02,
    });
    // Fill
    const fw = Math.max(0.05, (val / maxVal) * barW);
    slide.addShape(pres.shapes.ROUNDED_RECTANGLE, {
      x: x + LW + gap, y: ry + bh * 0.28, w: fw, h: bh * 0.44,
      fill: { color: colour || "00FFC4" },
      line: { color: colour || "00FFC4" },
      rectRadius: 0.02,
    });
    // Value label
    slide.addText(`${val.toFixed(1)}%`, {
      x: x + LW + gap + fw + 0.04, y: ry, w: valW, h: bh,
      fontSize: 9.5, fontFace: FONT, bold: true,
      color: "FFFFFF", valign: "middle", margin: 0,
    });
  });
}
```

### Dark card helper

```js
function darkCard(slide, x, y, w, h, mintBorder) {
  slide.addShape(pres.shapes.ROUNDED_RECTANGLE, {
    x, y, w, h,
    fill: { color: "1E1E1E" },
    line: { color: mintBorder ? "00FFC4" : "333333",
            width: mintBorder ? 1 : 0.5 },
    rectRadius: 0.06,
  });
}
```

### Two-column dark table helper

```js
function darkTable(slide, x, y, w, rows, col1Label, col2Label) {
  const rh = 0.27, hw = w * 0.68, sw = w * 0.32;
  // Header
  slide.addShape(pres.shapes.RECTANGLE, {
    x, y, w, h: rh,
    fill: { color: "00FFC4" }, line: { color: "00FFC4" },
  });
  slide.addText(col1Label, {
    x: x + 0.07, y, w: hw, h: rh,
    fontSize: 8, fontFace: FONT, bold: true, color: "121212",
    valign: "middle", margin: 0,
  });
  slide.addText(col2Label, {
    x: x + hw, y, w: sw - 0.07, h: rh,
    fontSize: 8, fontFace: FONT, bold: true, color: "121212",
    align: "right", valign: "middle", margin: 0,
  });
  // Data rows
  rows.forEach(([name, val], i) => {
    const ry = y + rh + i * rh;
    slide.addShape(pres.shapes.RECTANGLE, {
      x, y: ry, w, h: rh,
      fill: { color: i % 2 === 0 ? "1E1E1E" : "252525" },
      line: { color: "333333", width: 0.3 },
    });
    slide.addText(name, {
      x: x + 0.07, y: ry, w: hw, h: rh,
      fontSize: 8, fontFace: FONT, color: "B3B3B3",
      valign: "middle", margin: 0,
    });
    slide.addText(val, {
      x: x + hw, y: ry, w: sw - 0.07, h: rh,
      fontSize: 8, fontFace: FONT, color: "FFFFFF",
      align: "right", valign: "middle", margin: 0,
    });
  });
}
```
