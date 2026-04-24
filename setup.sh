#!/bin/bash
set -e

echo ""
echo "================================================"
echo "  Thera Sanctum — Local Development Setup"
echo "================================================"
echo ""

# ── 1. Check for Node.js ──────────────────────────────────────────────────────
if ! command -v node &> /dev/null; then
  echo "Node.js is not installed."
  echo ""
  echo "Please install Node.js v22 or higher from https://nodejs.org"
  echo "  → Download the LTS version and run the installer."
  echo "  → Then re-run this script."
  echo ""
  exit 1
fi

NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 22 ]; then
  echo "Node.js v$NODE_VERSION detected — v22 or higher is required."
  echo ""
  echo "Please update Node.js from https://nodejs.org and re-run this script."
  echo ""
  exit 1
fi

echo "Node.js $(node -v) — OK"

# ── 2. Check for npm ──────────────────────────────────────────────────────────
if ! command -v npm &> /dev/null; then
  echo "npm not found. It should come bundled with Node.js."
  echo "Please reinstall Node.js from https://nodejs.org"
  exit 1
fi

echo "npm $(npm -v) — OK"
echo ""

# ── 3. Install dependencies ───────────────────────────────────────────────────
echo "Installing dependencies..."
npm install
echo ""

# ── 4. Done ───────────────────────────────────────────────────────────────────
echo "================================================"
echo "  Setup complete!"
echo "================================================"
echo ""
echo "To start the local dev server, run:"
echo ""
echo "    npm run dev"
echo ""
echo "Then open http://localhost:4321 in your browser."
echo ""
