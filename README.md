# Factori Plugin for Claude Code

Location and people intelligence inside Claude — site selection, trade area analysis, foot traffic, competitive benchmarking, audience profiling, and more.

---

## Prerequisites

1. **Claude Code** installed on your machine

   **macOS / Linux:**
   ```bash
   curl -fsSL https://claude.ai/install.sh | bash
   ```
   **Windows:**
   ```powershell
   irm https://claude.ai/install.ps1 | iex
   ```

2. **A Factori account** — [Sign up at factori.ai](https://factori.ai)

---

## Installation

Open your terminal and run these two commands:

```bash
claude plugin marketplace add Factori-AI/factori-mcp-plugin
```

```bash
claude plugin install factori@factori-mcp-plugin
```

That's it. This installs the Factori MCP connector, all 12 analysis commands, and 4 background knowledge skills — no cloning, no manual setup.

---

## First-Time Sign In

The first time you run a `/factori:` command, a browser window will open to authorize Claude Code's access to your Factori account. If you're already logged into Factori, this will just be a quick "Allow access" confirmation. This is a one-time step.

---

## Available Commands

| Command | What it does |
|---|---|
| `/factori:site-selection` | Score a location 1–10 for opening a business — traffic, demographics, trade area, market opportunity |
| `/factori:area-snapshot` | Full commercial landscape scan — business mix, top brands, ratings, 90-day traffic momentum |
| `/factori:area-pulse` | When does an area peak — morning/daytime/night intensity, late-night %, weekday vs weekend |
| `/factori:trade-area` | Where your visitors come from and who they are — catchment, demographics, traffic patterns |
| `/factori:market-quality-audit` | Is the market saturated or is there room — opportunity level, vulnerable POI %, price tier gaps |
| `/factori:audience-build` | Turn a location's visitors into an ad audience — persona, geofence seed, look-alike seed, channel plan |
| `/factori:competitive-density` | Head-to-head comparison of your location vs a competitor — traffic, demographics, audience quality |
| `/factori:cannibalization-analysis` | How much would a new store steal from your existing ones — Go/No-Go/Adjust verdict |
| `/factori:close-impact` | If a store closes, where do its customers go — network absorption vs competitor bleed |
| `/factori:branch-optimization` | Rank your branch network, flag overlaps and gaps — consolidate/keep/expand recommendations |
| `/factori:ooh-planner` | Evaluate a billboard or OOH placement — daily impressions, peak hours, audience fit |
| `/factori:store-network-planner` | Plan infrastructure placement (EV chargers, ATMs, towers) using foot traffic and demand patterns |

---

## Usage Examples

Type a command followed by your location or question in plain language:

```
/factori:site-selection "I want to open a coffee shop in Fulton Market, Chicago — is it a strong spot or already too saturated?"
```

```
/factori:area-pulse "Time-of-day foot traffic for the Las Vegas Strip"
```

```
/factori:competitive-density "Equinox Flatiron vs Planet Fitness Union Square, NYC"
```

```
/factori:trade-area "Where do Pike Place Market, Seattle visitors come from?"
```

```
/factori:cannibalization-analysis "I want to open a new cafe in Santa Monica but I already have shops in Venice and Culver City — how much overlap?"
```

---

## Credit Usage

Some operations (unlocking people records, enriching place data) consume Factori credits. Claude will always show you a count and ask for your confirmation before any credits are spent. Browsing, counting, and previewing are always free.

Check your balance at [factori.ai](https://factori.ai).

---

## Links

- [factori.ai](https://factori.ai)
- [Privacy Policy](https://www.factori.ai/privacy-policy/)
- [Terms of Service](https://www.factori.ai/terms-of-use/)
- Support: support@factori.ai
