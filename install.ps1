$ErrorActionPreference = "Stop"

$ZipUrl = "https://github.com/Factori-AI/factori-mcp-plugin/releases/download/v1.0.0/factori-plugin.zip"
$InstallDir = "$HOME\.claude\factori-ai"

Write-Host "Installing Factori plugin for Claude Code..."

New-Item -ItemType Directory -Force -Path "$InstallDir\plugin" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\.claude-plugin" | Out-Null

@'
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
'@ | Set-Content -Path "$InstallDir\.claude-plugin\marketplace.json" -Encoding UTF8

Write-Host "Downloading plugin..."
$ZipPath = "$InstallDir\plugin.zip"
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath
Copy-Item $ZipPath -Destination "$env:USERPROFILE\Downloads\factori-plugin.zip"
Write-Host "Plugin zip saved to $env:USERPROFILE\Downloads\factori-plugin.zip"
if (Test-Path "$InstallDir\plugin") { Remove-Item -Recurse -Force "$InstallDir\plugin" }
Expand-Archive -Path $ZipPath -DestinationPath "$InstallDir" -Force
Remove-Item $ZipPath

try { claude plugin marketplace remove factori-ai 2>$null } catch {}

claude plugin marketplace add "$InstallDir"
claude plugin install "factori@factori-ai"

Write-Host ""
Write-Host "Factori plugin installed successfully!"
Write-Host "Restart Claude Code and use /factori: commands to get started."
