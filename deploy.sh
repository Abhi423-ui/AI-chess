#!/bin/bash
# Deploy Chess RL AI to Streamlit Cloud
# This script helps push your code to GitHub for Streamlit Cloud deployment

set -e  # Exit on error

echo "🎮 Chess RL AI - Streamlit Cloud Deployment Script"
echo "=================================================="
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing git repository..."
    git init
fi

# Ask for GitHub URL
echo "📝 Please provide your GitHub repository URL"
echo "   Example: https://github.com/YOUR_USERNAME/chess-rl-ai.git"
read -p "   GitHub URL: " GITHUB_URL

if [ -z "$GITHUB_URL" ]; then
    echo "❌ GitHub URL cannot be empty!"
    exit 1
fi

# Check if remote exists
if ! git remote | grep -q origin; then
    echo "🔗 Adding GitHub remote..."
    git remote add origin "$GITHUB_URL"
else
    echo "✅ Git remote already configured"
fi

# Verify all required files exist
echo ""
echo "📋 Checking deployment requirements..."

REQUIRED_FILES=("app.py" "requirements.txt" ".streamlit/config.toml" ".gitignore")
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file missing!"
        exit 1
    fi
done

# Add and commit
echo ""
echo "📦 Preparing files for deployment..."
git add .
git commit -m "Chess RL AI - Ready for Streamlit Cloud deployment" || echo "ℹ️  (Nothing new to commit)"

# Set branch to main
echo "🌿 Setting main branch..."
git branch -M main

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Deployment Complete!"
echo ""
echo "📱 Next Steps:"
echo "   1. Visit https://share.streamlit.io"
echo "   2. Click 'New app'"
echo "   3. Select repository: $(basename "$GITHUB_URL" .git)"
echo "   4. Set main file to: app.py"
echo "   5. Click 'Deploy' and wait 2-3 minutes"
echo ""
echo "🎯 Your app will be available at:"
echo "   https://YOUR_USERNAME-chess-rl-ai-XXXXX.streamlit.app"
echo ""
