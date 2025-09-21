# 🚀 GreenCart Logistics - Step-by-Step Deployment Guide

## Prerequisites Check
- ✅ Node.js installed
- ✅ Project files ready
- ✅ Dataset integrated
- ⚠️ Git needs to be installed for deployment

## Step 1: Install Git (Required for Deployment)

### Option A: Download Git for Windows
1. Go to https://git-scm.com/download/win
2. Download and install Git for Windows
3. Restart your terminal/PowerShell

### Option B: Use GitHub Desktop (Easier)
1. Go to https://desktop.github.com/
2. Download and install GitHub Desktop
3. Sign in with your GitHub account

## Step 2: Create GitHub Repository

### Using GitHub Desktop (Recommended)
1. Open GitHub Desktop
2. Click "Create a New Repository"
3. Name: `greencart-logistics-assessment`
4. Description: `GreenCart Logistics - Delivery Simulation & KPI Dashboard`
5. Make it Public
6. Click "Create Repository"

### Using Command Line (if Git is installed)
```bash
git init
git add .
git commit -m "Initial commit: GreenCart Logistics Assessment"
git branch -M main
git remote add origin https://github.com/yourusername/greencart-logistics-assessment.git
git push -u origin main
```

## Step 3: Deploy Backend to Render

1. **Go to Render Dashboard**
   - Visit https://dashboard.render.com
   - Sign up/Login with GitHub

2. **Create New Web Service**
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository

3. **Configure Backend Settings**
   - **Name**: `greencart-logistics-backend`
   - **Environment**: `Node`
   - **Build Command**: `cd backend && npm install`
   - **Start Command**: `cd backend && npm start`
   - **Root Directory**: `backend`

4. **Set Environment Variables**
   ```
   NODE_ENV=production
   MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/greencart_logistics
   JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random
   PORT=10000
   CORS_ORIGIN=https://your-frontend-domain.vercel.app
   ```

5. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment (5-10 minutes)
   - Note the service URL

## Step 4: Deploy Frontend to Vercel

1. **Go to Vercel Dashboard**
   - Visit https://vercel.com/dashboard
   - Sign up/Login with GitHub

2. **Import Project**
   - Click "New Project"
   - Import your GitHub repository
   - Select the repository

3. **Configure Frontend Settings**
   - **Framework Preset**: `Create React App`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`

4. **Set Environment Variables**
   ```
   REACT_APP_API_URL=https://your-backend-domain.onrender.com/api
   REACT_APP_ENVIRONMENT=production
   ```

5. **Deploy**
   - Click "Deploy"
   - Wait for deployment (2-5 minutes)
   - Note the deployment URL

## Step 5: Set up MongoDB Atlas

1. **Create MongoDB Atlas Account**
   - Go to https://www.mongodb.com/atlas
   - Sign up for free account

2. **Create Cluster**
   - Click "Create Cluster"
   - Choose M0 Sandbox (Free)
   - Select your region
   - Click "Create Cluster"

3. **Configure Database Access**
   - Go to "Database Access"
   - Click "Add New Database User"
   - Create username and password
   - Save credentials

4. **Configure Network Access**
   - Go to "Network Access"
   - Click "Add IP Address"
   - Add `0.0.0.0/0` (allow all IPs)
   - Save configuration

5. **Get Connection String**
   - Go to "Clusters"
   - Click "Connect"
   - Choose "Connect your application"
   - Copy connection string
   - Replace `<password>` with your password

## Step 6: Update Environment Variables

1. **Update Backend Environment Variables in Render**
   - Go to your Render service
   - Go to "Environment" tab
   - Update `MONGODB_URI` with your Atlas connection string
   - Update `CORS_ORIGIN` with your Vercel frontend URL

2. **Update Frontend Environment Variables in Vercel**
   - Go to your Vercel project
   - Go to "Settings" → "Environment Variables"
   - Update `REACT_APP_API_URL` with your Render backend URL

## Step 7: Seed Database

1. **Access Backend Logs**
   - Go to Render dashboard
   - Click on your backend service
   - Go to "Logs" tab

2. **Run Seed Command**
   - In Render, go to "Shell" tab
   - Run: `cd backend && npm run seed`
   - Verify data is loaded

## Step 8: Test Deployment

1. **Test Backend Health**
   ```bash
   curl https://your-backend-domain.onrender.com/health
   ```

2. **Test Frontend**
   - Visit your Vercel URL
   - Try logging in with demo credentials
   - Test simulation functionality

3. **Test API Endpoints**
   - Use Postman or browser
   - Test authentication
   - Test CRUD operations

## Step 9: Update Documentation

1. **Update README.md**
   - Replace placeholder URLs with actual deployment URLs
   - Update contact information
   - Verify all links work

2. **Create Submission Package**
   - GitHub repository link
   - Live deployment links
   - Demo credentials
   - Documentation links

## Troubleshooting

### Common Issues
1. **CORS Errors**: Check CORS_ORIGIN environment variable
2. **Database Connection**: Verify MongoDB URI format
3. **Build Failures**: Check Node.js version compatibility
4. **Environment Variables**: Ensure all required variables are set

### Debug Commands
```bash
# Check backend logs
# In Render dashboard → Logs tab

# Test database connection
mongosh "your-mongodb-connection-string"

# Test API endpoints
curl -v https://your-backend-domain.onrender.com/health
```

## Final Checklist

- [ ] Git installed and repository created
- [ ] Backend deployed to Render
- [ ] Frontend deployed to Vercel
- [ ] MongoDB Atlas cluster created
- [ ] Environment variables configured
- [ ] Database seeded with dataset
- [ ] All endpoints tested
- [ ] Documentation updated
- [ ] Demo credentials working

## Next Steps

1. **Install Git** (if not already installed)
2. **Create GitHub Repository**
3. **Deploy Backend to Render**
4. **Deploy Frontend to Vercel**
5. **Set up MongoDB Atlas**
6. **Test Complete Application**

---

**Ready to proceed with deployment!** 🚀
