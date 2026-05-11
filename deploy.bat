@echo off
REM Deploy Chess RL AI to Streamlit Cloud
REM This script helps push your code to GitHub for Streamlit Cloud deployment

setlocal enabledelayedexpansion

echo 🎮 Chess RL AI - Streamlit Cloud Deployment Script
echo ==================================================
echo.

REM Check if git is initialized
if not exist ".git" (
    echo 🔧 Initializing git repository...
    call git init
)

REM Ask for GitHub URL
echo 📝 Please provide your GitHub repository URL
echo    Example: https://github.com/YOUR_USERNAME/chess-rl-ai.git
set /p GITHUB_URL="    GitHub URL: "

if "%GITHUB_URL%"=="" (
    echo ❌ GitHub URL cannot be empty!
    exit /b 1
)

REM Check if remote exists
git remote | find "origin" >nul
if errorlevel 1 (
    echo 🔗 Adding GitHub remote...
    call git remote add origin %GITHUB_URL%
) else (
    echo ✅ Git remote already configured
)

REM Verify all required files exist
echo.
echo 📋 Checking deployment requirements...

if exist "app.py" (echo   ✅ app.py) else (echo   ❌ app.py missing! & exit /b 1)
if exist "requirements.txt" (echo   ✅ requirements.txt) else (echo   ❌ requirements.txt missing! & exit /b 1)
if exist ".streamlit\config.toml" (echo   ✅ .streamlit/config.toml) else (echo   ❌ .streamlit/config.toml missing! & exit /b 1)
if exist ".gitignore" (echo   ✅ .gitignore) else (echo   ❌ .gitignore missing! & exit /b 1)

REM Add and commit
echo.
echo 📦 Preparing files for deployment...
call git add .
call git commit -m "Chess RL AI - Ready for Streamlit Cloud deployment"

REM Set branch to main
echo 🌿 Setting main branch...
call git branch -M main

REM Push to GitHub
echo.
echo 🚀 Pushing to GitHub...
call git push -u origin main

echo.
echo ✅ Deployment Complete!
echo.
echo 📱 Next Steps:
echo    1. Visit https://share.streamlit.io
echo    2. Click 'New app'
echo    3. Select your repository
echo    4. Set main file to: app.py
echo    5. Click 'Deploy' and wait 2-3 minutes
echo.
echo 🎯 Your app will be available at:
echo    https://YOUR_USERNAME-chess-rl-ai-XXXXX.streamlit.app
echo.

pause
