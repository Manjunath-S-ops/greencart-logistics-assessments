# GreenCart Logistics - Deployment Helper Script

Write-Host "🚀 GreenCart Logistics - Deployment Helper Script" -ForegroundColor Green
Write-Host ""

Write-Host "📋 Checking prerequisites..." -ForegroundColor Yellow
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed. Please install Git first:" -ForegroundColor Red
    Write-Host "   1. Go to https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host "   2. Download and install Git for Windows" -ForegroundColor Cyan
    Write-Host "   3. Restart this terminal and run this script again" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "📁 Initializing Git repository..." -ForegroundColor Yellow
git init

Write-Host ""
Write-Host "📝 Adding all files to Git..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "💾 Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: GreenCart Logistics Assessment - Complete implementation with dataset integration"

Write-Host ""
Write-Host "🌿 Setting up main branch..." -ForegroundColor Yellow
git branch -M main

Write-Host ""
Write-Host "📊 Git status:" -ForegroundColor Yellow
git status

Write-Host ""
Write-Host "🎉 Git repository initialized successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Create a GitHub repository at https://github.com/new" -ForegroundColor White
Write-Host "   2. Copy the repository URL" -ForegroundColor White
Write-Host "   3. Run: git remote add origin YOUR_REPO_URL" -ForegroundColor White
Write-Host "   4. Run: git push -u origin main" -ForegroundColor White
Write-Host "   5. Deploy backend to Render" -ForegroundColor White
Write-Host "   6. Deploy frontend to Vercel" -ForegroundColor White
Write-Host ""

Read-Host "Press Enter to continue"
