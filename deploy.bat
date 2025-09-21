@echo off
echo 🚀 GreenCart Logistics - Deployment Helper Script
echo.

echo 📋 Checking prerequisites...
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed. Please install Git first:
    echo    1. Go to https://git-scm.com/download/win
    echo    2. Download and install Git for Windows
    echo    3. Restart this terminal and run this script again
    echo.
    pause
    exit /b 1
)

echo ✅ Git is installed
echo.

echo 📁 Initializing Git repository...
git init
echo.

echo 📝 Adding all files to Git...
git add .
echo.

echo 💾 Creating initial commit...
git commit -m "Initial commit: GreenCart Logistics Assessment - Complete implementation with dataset integration"
echo.

echo 🌿 Setting up main branch...
git branch -M main
echo.

echo 📊 Git status:
git status
echo.

echo 🎉 Git repository initialized successfully!
echo.
echo 📋 Next steps:
echo    1. Create a GitHub repository at https://github.com/new
echo    2. Copy the repository URL
echo    3. Run: git remote add origin YOUR_REPO_URL
echo    4. Run: git push -u origin main
echo    5. Deploy backend to Render
echo    6. Deploy frontend to Vercel
echo.

pause
