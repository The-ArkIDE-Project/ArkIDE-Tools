#!/bin/bash

# ============================================
# ArkIDE Workspace Setup Script
# ============================================

echo "╔════════════════════════════════════════╗"
echo "║   ArkIDE Workspace Setup Script        ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Configuration
export ARKIDE_WORKSPACE_DIR="$HOME/ArkIDE_Workspace"

# Repository URLs (customize these)
REPO1="https://github.com/The-ArkIDE-Project/ArkIDE-Home.git"
REPO2="https://github.com/The-ArkIDE-Project/arkide-new.git"
REPO3="https://github.com/The-ArkIDE-Project/ArkIDE-Desktop.git"
REPO4="https://github.com/The-ArkIDE-Project/ArkIDE-ObjectLibraries.git"
REPO5="https://github.com/The-ArkIDE-Project/ArkIDE-ExtensionGallery.git"
# Add more repositories as needed
# REPO4="https://github.com/username/repo4.git"
# REPO5="https://github.com/username/repo5.git"

# Store all repos in an array
REPOS=(
    "$REPO1"
    "$REPO2"
    "$REPO3"
    "$REPO4"
    "$REPO5"
)

# Display configuration
echo "Workspace Directory: $ARKIDE_WORKSPACE_DIR"
echo "Repositories to clone:"
for repo in "${REPOS[@]}"; do
    echo "  • $repo"
done
echo ""

# Confirmation prompt
read -p "Do you want to proceed with cloning these repositories? (y/n): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Setup cancelled by user."
    exit 0
fi

echo ""
echo "✓ Starting setup..."
echo ""

# Create workspace directory
mkdir -p "$ARKIDE_WORKSPACE_DIR"
cd "$ARKIDE_WORKSPACE_DIR" || exit 1

# Clone repositories
echo "📦 Cloning repositories..."
for repo in "${REPOS[@]}"; do
    echo "  Cloning: $repo"
    git clone "$repo"
done

echo ""
echo "🗑️  Removing .git folders..."

# Remove all .git folders
find "$ARKIDE_WORKSPACE_DIR" -type d -name ".git" -exec rm -rf {} + 2>/dev/null

echo ""
echo "╔════════════════════════════════════════╗"
echo "║   ✓ Setup Complete!                    ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "Workspace location: $ARKIDE_WORKSPACE_DIR"