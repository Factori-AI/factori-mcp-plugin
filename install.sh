#!/bin/bash
set -e

ZIP_URL="https://github.com/Factori-AI/factori-mcp-plugin/releases/download/v1.0.0/factori-plugin.zip"
INSTALL_DIR="$HOME/.claude/factori-ai"

echo "Installing Factori plugin for Claude Code..."

mkdir -p "$INSTALL_DIR/plugin"
mkdir -p "$INSTALL_DIR/.claude-plugin"

# Write marketplace.json
cat > "$INSTALL_DIR/.claude-plugin/marketplace.json" << 'EOF'
{
  "name": "factori-ai",
  "description": "Factori location and people intelligence plugin",
  "owner": {
    "name": "Factori"
  },
  "plugins": [
    {
      "name": "factori",
      "source": "./plugin"
    }
  ]
}
EOF

# Download and extract plugin
echo "Downloading plugin..."
curl -fsSL -o "$INSTALL_DIR/plugin.zip" "$ZIP_URL"
rm -rf "$INSTALL_DIR/plugin"
unzip -q -o "$INSTALL_DIR/plugin.zip" -d "$INSTALL_DIR"
rm "$INSTALL_DIR/plugin.zip"

# Remove existing marketplace if present
claude plugin marketplace remove factori-ai 2>/dev/null || true

# Add marketplace and install plugin
claude plugin marketplace add "$INSTALL_DIR"
claude plugin install "factori@factori-ai"

echo ""
echo "Factori plugin installed successfully!"
echo "Restart Claude Code and use /factori: commands to get started."
