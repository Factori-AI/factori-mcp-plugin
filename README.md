# Factori AI

Turn location questions into instant, data-driven insights powered by real-world foot traffic, POI, demographics data and more.

Factori enables Claude to analyze places, people, foot traffic, trade areas, market opportunities, competitive landscapes, and audience behavior using natural language. Factori brings foot traffic data, place analytics, demographic profiles, and trade area signals into your Claude workflow. Analyze locations, score sites and trade areas, assess markets, and plan OOH placements without leaving the conversation.

---

## Available Skills

| Skill | Description |
|---|---|
| `/factori:site-selection` | Scores a location 1–10 for opening a business across traffic, demographics, catchment, and opportunity, with an Open / Caution / Pass verdict. |
| `/factori:area-intelligence` | Profiles everything operating in an area and rates how healthy it is — what's clustered there, the top categories, brands, ratings, price tiers, and traffic momentum, ending in a Vibrant / Stable / Soft verdict. |
| `/factori:area-pulse-analysis` | Breaks down an area's daily rhythm — peak hours by morning/day/night, late-night share, and weekday vs weekend patterns. |
| `/factori:trade-area-deep-dive` | Maps a location's catchment and audience — visit volume, demographics, time-of-day patterns, and where visitors travel from. |
| `/factori:market-quality` | Scores how crowded and contestable a market is — saturation, share of weak players, price gaps — and returns an Enter / Differentiate / Avoid call. |
| `/factori:audience-build` | Turns a place's visitors into a ready-to-use audience, profiles who they are, maps where they come from, and contrasts them with who lives nearby. |
| `/factori:competitive-intelligence` | Compares two locations head-to-head on traffic, visitor demographics, and audience quality to expose advantages and weaknesses. |
| `/factori:cannibalization-analysis` | Estimates how much a proposed new location would pull from your existing ones and returns a Go / No-Go / Adjust call. |
| `/factori:closure-impact-analysis` | Models what happens when a location shuts down — where its visitors go, how many you keep, and how many you lose to competitors. |
| `/factori:ooh-planner` | Sizes a billboard/placement spot — daily impressions, peak hours, who passes by, and how well they match your target. |

---

## Prerequisites

Before installing the Factori AI Plugin, make sure you have the following:

### 1. Claude Account (Required)

You must have an active [Claude.ai](https://claude.ai) account to use Claude Desktop or Claude Code.

**For Claude Code** — install Claude Code:

**macOS / Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows:**
```powershell
irm https://claude.ai/install.ps1 | iex
```

### 2. Factori Account

[Sign up at factori.ai](https://factori.ai)

---

## Installation

### Claude.ai / Desktop

1. Ensure Factori MCP is connected. Add Factori as a custom connector using:
   - **MCP Server URL:** `https://mcp.factori.ai/mcp`
2. Download Factori AI Plugin here: [Click here to download plugin](https://github.com/Factori-AI/factori-mcp-plugin/releases/latest/download/factori-plugin.zip)
3. Install the Plugin in Claude:
   - Open Claude (browser or desktop)
   - Click **Customize**
   - Next to Personal plugins, click **+**
   - Select **Create plugin** → **Upload plugin**
   - Upload the downloaded ZIP file

Done — The Factori AI skills are now ready to use directly in chat.

Visit [docs.factori.ai/docs/factori-ai-plugin](https://docs.factori.ai/docs/factori-ai-plugin) for more information about the Factori AI Plugin.

### Claude Code & CLI

Run the following commands to install the plugin:

**macOS / Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/Factori-AI/factori-mcp-plugin/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Factori-AI/factori-mcp-plugin/main/install.ps1 | iex
```

**What happens after installation?** The installer automatically:
- Installs the Factori MCP connector
- Registers all Factori skills
- Configures authentication
- Enables location intelligence inside Claude Code & CLI

---

## Example Prompts

```
/factori:site-selection "I want to open a coffee shop in the Mission District, San Francisco. Is this a good location based on competition, foot traffic, and market growth?"
```

```
/factori:area-intelligence "Give me a commercial landscape profile of Ponce City Market. Analyze everything operating in the area, including business clusters, top categories, leading brands, ratings, price tiers, and traffic momentum. Assess overall market health and conclude with a Vibrant, Stable, or Soft verdict."
```

```
/factori:area-pulse-analysis "Show me the time-of-day foot traffic profile for Buckhead, Atlanta. Break down peak activity by morning, daytime, evening, and late night, including weekday vs. weekend patterns and late-night traffic share."
```

```
/factori:trade-area-deep-dive "Who visits Pike Place Market, Seattle, and where do they come from? Analyze visitor volume, demographics, time-of-day visitation patterns, and the market's catchment area, including where visitors travel from."
```

```
/factori:market-quality "Is the retail and dining market around Lenox Square saturated? Analyze market saturation, competitive density, share of weak operators, pricing gaps, and opportunities for differentiation, then provide an Enter, Differentiate, or Avoid recommendation."
```

```
/factori:audience-build "Build an audience profile for visitors to Santa Monica Pier. Identify who they are, where they come from, and how they differ from local residents."
```

```
/factori:competitive-intelligence "Compare the Flatiron District (Equinox area) and Union Square (Planet Fitness area), analyzing foot traffic, visitor demographics, and audience quality, and highlight the strengths and weaknesses of each market."
```

```
/factori:cannibalization-analysis "I want to open a new cafe in Santa Monica but I already have shops in Venice and Culver City — how much overlap?"
```

```
/factori:closure-impact-analysis "If I close my store in the Financial District, San Francisco, model where customers will go, how many I retain, and how much demand shifts to nearby competitors in SoMa and Union Square."
```

```
/factori:ooh-planner "Evaluate a billboard placement on Peachtree Street in Atlanta, Georgia, including estimated daily impressions, peak viewing hours, passerby demographics, and alignment with the target audience."
```

---

## Credit Usage

Unlocking people records requires Factori credits. Claude will show the number of credits required and request approval before unlocking any records. Browsing, discovery, counting, previews, and exploration remain free.

---

## About Factori

Factori delivers advanced location intelligence through rich global datasets and powerful APIs. Collecting over 90B+ location signals daily across 229 countries, we empower businesses to unlock insights and make smarter, location-based decisions. Built on a privacy-first foundation, we transform raw data into actionable intelligence that drives growth, innovation, and new opportunities worldwide.

---

## Support

- **Website:** [factori.ai](https://factori.ai)
- **Support:** support@factori.ai
- **Privacy Policy:** [factori.ai/privacy-policy](https://www.factori.ai/privacy-policy/)
- **Terms of Service:** [factori.ai/terms-of-use](https://www.factori.ai/terms-of-use/)
