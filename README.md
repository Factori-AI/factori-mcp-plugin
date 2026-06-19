# Factori for Claude Code

Real-world location and audience intelligence inside Claude.

Factori enables Claude to analyze places, people, foot traffic, trade areas, market opportunities, competitive landscapes, and audience behavior using natural language.

Use Factori to answer questions such as:
- Is this a good location to open a business?
- How healthy is this market?
- Who visits this area and where do they come from?
- How does my location compare against competitors?
- What happens if I open, close, or relocate a location?
- How many people will see my billboard or advertising placement?

---

## Prerequisites

1. **Install Claude Code**

   **macOS / Linux:**
   ```bash
   curl -fsSL https://claude.ai/install.sh | bash
   ```
   **Windows:**
   ```powershell
   irm https://claude.ai/install.ps1 | iex
   ```

2. **Create a Factori Account** — [Sign up at factori.ai](https://factori.ai)

---

## Installation

**macOS / Linux** — open Terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/Factori-AI/factori-mcp-plugin/main/install.sh | bash
```

**Windows** — open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/Factori-AI/factori-mcp-plugin/main/install.ps1 | iex
```

The installer automatically:
- Installs the Factori MCP connector
- Registers all Factori skills
- Configures authentication
- Enables location intelligence inside Claude Code

No manual setup, Git cloning, or configuration required.

---

## First-Time Authentication

The first time you invoke a Factori skill, Claude Code will open a browser window and prompt you to authorize access to your Factori account. If you are already signed in to Factori, simply approve the authorization request. This is a one-time setup step.

---

## Available Skills

| Skill | Description |
|---|---|
| `/factori:site-selection` | Scores a location 1–10 for opening a business across traffic, demographics, catchment, and opportunity, with an Open / Caution / Pass verdict. |
| `/factori:area-intelligence` | Profiles everything operating in an area and rates how healthy it is — what's clustered there, the top categories, brands, ratings, price tiers, and traffic momentum, ending in a Vibrant/Stable/Soft verdict. |
| `/factori:area-pulse-analysis` | Breaks down an area's daily rhythm — peak hours by morning/day/night, late-night share, and weekday vs weekend patterns. |
| `/factori:trade-area-deep-dive` | Maps a location's catchment and audience — visit volume, demographics, time-of-day patterns, and where visitors travel from. |
| `/factori:market-quality` | Scores how crowded and contestable a market is — saturation, share of weak players, price gaps — and returns an Enter / Differentiate / Avoid call. |
| `/factori:audience-build` | Turns a place's visitors into a ready-to-use audience, profiles who they are, maps where they come from, and contrasts them with who lives nearby. |
| `/factori:competitive-intelligence` | Compares two locations head-to-head on traffic, visitor demographics, and audience quality to expose advantages and weaknesses. |
| `/factori:cannibalization-analysis` | Estimates how much a proposed new location would pull from your existing ones and returns a Go / No-Go / Adjust call. |
| `/factori:closure-impact-analysis` | Models what happens when a location shuts down — where its visitors go, how many you keep, and how many you lose to competitors. |
| `/factori:ooh-planner` | Sizes a billboard/placement spot — daily impressions, peak hours, who passes by, and how well they match your target. |

---

## Usage Examples

```
/factori:site-selection "I want to open a coffee shop in Fulton Market, Chicago — is it a strong spot or already too saturated?"
```

```
/factori:area-intelligence "Give me a commercial landscape profile of Downtown Austin"
```

```
/factori:area-pulse-analysis "Time-of-day foot traffic for the Las Vegas Strip"
```

```
/factori:trade-area-deep-dive "Where do Pike Place Market, Seattle visitors come from?"
```

```
/factori:market-quality "Is the fitness market in Nashville saturated?"
```

```
/factori:audience-build "Build an audience profile for visitors to Venice Beach"
```

```
/factori:competitive-intelligence "Equinox Flatiron vs Planet Fitness Union Square, NYC"
```

```
/factori:cannibalization-analysis "I want to open a new cafe in Santa Monica but I already have shops in Venice and Culver City — how much overlap?"
```

```
/factori:closure-impact-analysis "If I close my downtown location, where will customers go?"
```

```
/factori:ooh-planner "Evaluate a billboard placement on Sunset Boulevard"
```

---

## Credit Usage

Some operations may consume Factori credits, including:
- Unlocking people records
- Audience enrichment
- Place enrichment
- Premium intelligence operations

Before credits are used, Claude will display the estimated credit cost, request confirmation, and execute only after approval. Browsing, discovery, counting, previews, and exploration remain free.

---

## About Factori

Factori provides the real-world intelligence layer for AI agents and enterprise AI systems. By combining place intelligence, mobility patterns, audience insights, and market analytics, Factori enables AI systems to reason about the physical world with the same depth they reason about digital information.

---

## Support

- **Website:** [factori.ai](https://factori.ai)
- **Support:** support@factori.ai
- **Privacy Policy:** [factori.ai/privacy-policy](https://www.factori.ai/privacy-policy/)
- **Terms of Service:** [factori.ai/terms-of-use](https://www.factori.ai/terms-of-use/)
