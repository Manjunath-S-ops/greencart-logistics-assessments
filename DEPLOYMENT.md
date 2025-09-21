# 🚀 GreenCart Logistics - Deployment Guide

## Overview

This guide provides step-by-step instructions for deploying the GreenCart Logistics application to production environments.

## 🏗️ Architecture

- **Frontend**: React SPA deployed on Vercel/Netlify
- **Backend**: Node.js API deployed on Render/Railway/Heroku
- **Database**: MongoDB Atlas (Cloud-hosted)
- **CDN**: Static assets served via Vercel/Netlify

## 📋 Prerequisites

- Node.js 18+ installed locally
- MongoDB Atlas account
- Vercel/Netlify account (for frontend)
- Render/Railway/Heroku account (for backend)
- Git repository with your code

---

## 🗄️ Database Setup (MongoDB Atlas)

### 1. Create MongoDB Atlas Cluster

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Create a new account or sign in
3. Create a new cluster (M0 Sandbox is free)
4. Choose your preferred region
5. Create cluster

### 2. Configure Database Access

1. Go to "Database Access" in the left sidebar
2. Click "Add New Database User"
3. Create a user with read/write permissions
4. Save the username and password

### 3. Configure Network Access

1. Go to "Network Access" in the left sidebar
2. Click "Add IP Address"
3. Add `0.0.0.0/0` for all IPs (or specific IPs for security)
4. Save the configuration

### 4. Get Connection String

1. Go to "Clusters" in the left sidebar
2. Click "Connect" on your cluster
3. Choose "Connect your application"
4. Copy the connection string
5. Replace `<password>` with your database user password

**Example Connection String:**
```
mongodb+srv://username:password@cluster0.abc123.mongodb.net/greencart_logistics?retryWrites=true&w=majority
```

---

## 🖥️ Backend Deployment (Render)

### 1. Prepare Backend for Deployment

1. **Update package.json scripts:**
   ```json
   {
     "scripts": {
       "start": "node server.js",
       "dev": "nodemon server.js",
       "build": "echo 'No build step required'",
       "test": "jest"
     }
   }
   ```

2. **Create render.yaml (optional):**
   ```yaml
   services:
     - type: web
       name: greencart-backend
       env: node
       plan: free
       buildCommand: npm install
       startCommand: npm start
       envVars:
         - key: NODE_ENV
           value: production
         - key: MONGODB_URI
           fromDatabase:
             name: greencart-db
             property: connectionString
   ```

### 2. Deploy to Render

1. **Connect Repository:**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select the repository and branch

2. **Configure Service:**
   - **Name**: `greencart-logistics-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free

3. **Set Environment Variables:**
   ```
   NODE_ENV=production
   MONGODB_URI=mongodb+srv://username:password@cluster0.abc123.mongodb.net/greencart_logistics?retryWrites=true&w=majority
   JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random
   PORT=10000
   CORS_ORIGIN=https://your-frontend-domain.vercel.app
   ```

4. **Deploy:**
   - Click "Create Web Service"
   - Wait for deployment to complete
   - Note the service URL (e.g., `https://greencart-backend.onrender.com`)

### 3. Alternative: Railway Deployment

1. **Connect to Railway:**
   - Go to [Railway](https://railway.app)
   - Sign in with GitHub
   - Click "New Project" → "Deploy from GitHub repo"

2. **Configure Environment:**
   - Select your repository
   - Add environment variables in Railway dashboard
   - Railway will auto-detect Node.js and deploy

### 4. Alternative: Heroku Deployment

1. **Install Heroku CLI:**
   ```bash
   npm install -g heroku
   ```

2. **Create Heroku App:**
   ```bash
   heroku create greencart-logistics-backend
   ```

3. **Set Environment Variables:**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set MONGODB_URI="your-mongodb-connection-string"
   heroku config:set JWT_SECRET="your-jwt-secret"
   heroku config:set CORS_ORIGIN="https://your-frontend-domain.vercel.app"
   ```

4. **Deploy:**
   ```bash
   git push heroku main
   ```

---

## 🌐 Frontend Deployment (Vercel)

### 1. Prepare Frontend for Deployment

1. **Update package.json:**
   ```json
   {
     "scripts": {
       "start": "react-scripts start",
       "build": "react-scripts build",
       "test": "react-scripts test",
       "eject": "react-scripts eject"
     }
   }
   ```

2. **Create vercel.json (optional):**
   ```json
   {
     "version": 2,
     "builds": [
       {
         "src": "package.json",
         "use": "@vercel/static-build",
         "config": {
           "distDir": "build"
         }
       }
     ],
     "routes": [
       {
         "src": "/static/(.*)",
         "headers": {
           "cache-control": "s-maxage=31536000,immutable"
         }
       },
       {
         "src": "/(.*)",
         "dest": "/index.html"
       }
     ]
   }
   ```

### 2. Deploy to Vercel

1. **Connect Repository:**
   - Go to [Vercel Dashboard](https://vercel.com/dashboard)
   - Click "New Project"
   - Import your GitHub repository
   - Select the repository

2. **Configure Build Settings:**
   - **Framework Preset**: `Create React App`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`

3. **Set Environment Variables:**
   ```
   REACT_APP_API_URL=https://greencart-backend.onrender.com/api
   REACT_APP_ENVIRONMENT=production
   ```

4. **Deploy:**
   - Click "Deploy"
   - Wait for deployment to complete
   - Note the deployment URL (e.g., `https://greencart-logistics.vercel.app`)

### 3. Alternative: Netlify Deployment

1. **Connect to Netlify:**
   - Go to [Netlify](https://netlify.com)
   - Sign in with GitHub
   - Click "New site from Git"

2. **Configure Build:**
   - **Build Command**: `cd frontend && npm run build`
   - **Publish Directory**: `frontend/build`
   - **Base Directory**: `frontend`

3. **Set Environment Variables:**
   - Go to Site Settings → Environment Variables
   - Add `REACT_APP_API_URL` with your backend URL

---

## 🔧 Environment Variables Reference

### Backend Environment Variables

```env
# Database
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/greencart_logistics?retryWrites=true&w=majority

# JWT Configuration
JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random
JWT_EXPIRES_IN=24h

# Server Configuration
PORT=5000
NODE_ENV=production

# CORS Configuration
CORS_ORIGIN=https://your-frontend-domain.vercel.app

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# Logging
LOG_LEVEL=info
```

### Frontend Environment Variables

```env
# API Configuration
REACT_APP_API_URL=https://your-backend-domain.onrender.com/api
REACT_APP_ENVIRONMENT=production

# Optional: Analytics
REACT_APP_GA_TRACKING_ID=your-google-analytics-id
```

---

## 🧪 Testing Deployment

### 1. Backend Health Check

```bash
curl https://your-backend-domain.onrender.com/health
```

**Expected Response:**
```json
{
  "status": "OK",
  "timestamp": "2023-07-01T10:00:00.000Z",
  "environment": "production"
}
```

### 2. Frontend Accessibility

1. Visit your frontend URL
2. Check if the application loads
3. Test login functionality
4. Verify API calls work

### 3. Database Connection

1. Run a test API call:
   ```bash
   curl -X POST https://your-backend-domain.onrender.com/api/auth/login \
     -H "Content-Type: application/json" \
     -d '{"email":"admin@greencart.com","password":"admin123"}'
   ```

---

## 🔒 Security Considerations

### 1. Environment Variables

- Never commit `.env` files to version control
- Use strong, unique JWT secrets
- Rotate secrets regularly
- Use different secrets for different environments

### 2. CORS Configuration

- Set specific origins instead of `*`
- Update CORS_ORIGIN when deploying frontend
- Test CORS with actual domain names

### 3. Database Security

- Use MongoDB Atlas IP whitelist
- Enable database authentication
- Use strong passwords
- Enable MongoDB Atlas monitoring

### 4. API Security

- Rate limiting is enabled by default
- JWT tokens expire after 24 hours
- Input validation on all endpoints
- Error messages don't expose sensitive information

---

## 📊 Monitoring and Logging

### 1. Backend Monitoring

- **Render**: Built-in metrics and logs
- **Railway**: Real-time logs and metrics
- **Heroku**: Add-ons for monitoring

### 2. Database Monitoring

- **MongoDB Atlas**: Built-in monitoring
- Set up alerts for:
  - High CPU usage
  - Slow queries
  - Connection limits

### 3. Frontend Monitoring

- **Vercel**: Built-in analytics
- **Netlify**: Built-in analytics
- Consider adding error tracking (Sentry)

---

## 🚨 Troubleshooting

### Common Issues

1. **CORS Errors**
   - Check CORS_ORIGIN environment variable
   - Ensure frontend URL is correct
   - Verify protocol (http vs https)

2. **Database Connection Issues**
   - Check MongoDB URI format
   - Verify network access settings
   - Check database user permissions

3. **Build Failures**
   - Check Node.js version compatibility
   - Verify all dependencies are in package.json
   - Check for syntax errors

4. **Environment Variable Issues**
   - Verify all required variables are set
   - Check variable names (case-sensitive)
   - Ensure no extra spaces or quotes

### Debug Commands

```bash
# Check backend logs
heroku logs --tail  # For Heroku
# Or check platform-specific logs

# Test database connection
mongosh "your-mongodb-connection-string"

# Test API endpoints
curl -v https://your-backend-domain.onrender.com/health
```

---

## 📈 Performance Optimization

### 1. Backend Optimization

- Enable gzip compression
- Use MongoDB indexes
- Implement caching (Redis)
- Optimize database queries

### 2. Frontend Optimization

- Enable gzip compression
- Use CDN for static assets
- Implement lazy loading
- Optimize bundle size

### 3. Database Optimization

- Create appropriate indexes
- Monitor slow queries
- Use connection pooling
- Optimize data models

---

## 🔄 CI/CD Pipeline (Optional)

### GitHub Actions Example

```yaml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy-backend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Render
        run: |
          # Add deployment commands here

  deploy-frontend:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to Vercel
        run: |
          # Add deployment commands here
```

---

## 📞 Support

For deployment issues:

1. Check platform-specific documentation
2. Review error logs
3. Test locally first
4. Verify environment variables
5. Check network connectivity

---

**Deployment Guide Version**: 1.0.0  
**Last Updated**: July 2023