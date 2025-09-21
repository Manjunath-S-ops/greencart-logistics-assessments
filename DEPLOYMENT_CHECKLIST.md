# 🚀 GreenCart Logistics - Deployment Checklist

## ✅ **Ready for Deployment!**

Your GreenCart Logistics assessment is complete and ready for deployment. Here's your step-by-step checklist:

### **📋 Prerequisites**
- [ ] Install Git for Windows: https://git-scm.com/download/win
- [ ] Create GitHub account: https://github.com
- [ ] Create MongoDB Atlas account: https://www.mongodb.com/atlas
- [ ] Create Render account: https://render.com
- [ ] Create Vercel account: https://vercel.com

### **🔧 Step 1: Initialize Git Repository**
1. **Run the deployment script:**
   ```bash
   # Double-click deploy.bat or run in PowerShell:
   .\deploy.ps1
   ```

2. **Create GitHub Repository:**
   - Go to https://github.com/new
   - Repository name: `greencart-logistics-assessment`
   - Description: `GreenCart Logistics - Delivery Simulation & KPI Dashboard`
   - Make it **Public**
   - Click "Create repository"

3. **Connect to GitHub:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/greencart-logistics-assessment.git
   git push -u origin main
   ```

### **🗄️ Step 2: Set up MongoDB Atlas**
1. **Create Cluster:**
   - Go to MongoDB Atlas dashboard
   - Click "Create Cluster"
   - Choose M0 Sandbox (Free)
   - Select your region
   - Click "Create Cluster"

2. **Configure Database Access:**
   - Go to "Database Access"
   - Click "Add New Database User"
   - Username: `greencart_user`
   - Password: Generate secure password
   - Database User Privileges: "Read and write to any database"
   - Click "Add User"

3. **Configure Network Access:**
   - Go to "Network Access"
   - Click "Add IP Address"
   - Click "Allow Access from Anywhere" (0.0.0.0/0)
   - Click "Confirm"

4. **Get Connection String:**
   - Go to "Clusters"
   - Click "Connect"
   - Choose "Connect your application"
   - Copy the connection string
   - Replace `<password>` with your password

### **🖥️ Step 3: Deploy Backend to Render**
1. **Create Web Service:**
   - Go to https://dashboard.render.com
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select `greencart-logistics-assessment`

2. **Configure Settings:**
   - **Name**: `greencart-logistics-backend`
   - **Environment**: `Node`
   - **Build Command**: `cd backend && npm install`
   - **Start Command**: `cd backend && npm start`
   - **Root Directory**: `backend`

3. **Set Environment Variables:**
   ```
   NODE_ENV=production
   MONGODB_URI=mongodb+srv://greencart_user:YOUR_PASSWORD@cluster0.abc123.mongodb.net/greencart_logistics?retryWrites=true&w=majority
   JWT_SECRET=your-super-secret-jwt-key-here-make-it-long-and-random-at-least-32-characters
   PORT=10000
   CORS_ORIGIN=https://your-frontend-domain.vercel.app
   ```

4. **Deploy:**
   - Click "Create Web Service"
   - Wait for deployment (5-10 minutes)
   - Note the service URL (e.g., `https://greencart-logistics-backend.onrender.com`)

### **🌐 Step 4: Deploy Frontend to Vercel**
1. **Import Project:**
   - Go to https://vercel.com/dashboard
   - Click "New Project"
   - Import your GitHub repository
   - Select `greencart-logistics-assessment`

2. **Configure Settings:**
   - **Framework Preset**: `Create React App`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `build`

3. **Set Environment Variables:**
   ```
   REACT_APP_API_URL=https://greencart-logistics-backend.onrender.com/api
   REACT_APP_ENVIRONMENT=production
   ```

4. **Deploy:**
   - Click "Deploy"
   - Wait for deployment (2-5 minutes)
   - Note the deployment URL (e.g., `https://greencart-logistics.vercel.app`)

### **🔄 Step 5: Update Environment Variables**
1. **Update Backend CORS:**
   - Go to Render dashboard
   - Click on your backend service
   - Go to "Environment" tab
   - Update `CORS_ORIGIN` with your Vercel frontend URL
   - Redeploy the service

2. **Update Frontend API URL:**
   - Go to Vercel dashboard
   - Click on your project
   - Go to "Settings" → "Environment Variables"
   - Update `REACT_APP_API_URL` with your Render backend URL
   - Redeploy the project

### **🌱 Step 6: Seed Database**
1. **Access Backend Shell:**
   - Go to Render dashboard
   - Click on your backend service
   - Go to "Shell" tab

2. **Run Seed Command:**
   ```bash
   cd backend
   npm run seed
   ```

3. **Verify Data:**
   - Check logs for successful seeding
   - Verify 10 drivers, 10 routes, 50 orders created

### **🧪 Step 7: Test Deployment**
1. **Test Backend Health:**
   ```bash
   curl https://greencart-logistics-backend.onrender.com/health
   ```

2. **Test Frontend:**
   - Visit your Vercel URL
   - Try logging in with demo credentials:
     - Admin: `admin@greencart.com` / `admin123`
     - Manager: `manager@greencart.com` / `manager123`

3. **Test Simulation:**
   - Go to Simulation page
   - Run a simulation with default parameters
   - Verify results are displayed

### **📝 Step 8: Update Documentation**
1. **Update README.md:**
   - Replace placeholder URLs with actual deployment URLs
   - Update contact information
   - Verify all links work

2. **Create Final Submission:**
   - GitHub repository link
   - Live deployment links
   - Demo credentials
   - Documentation links

### **🎯 Final URLs (Update these with your actual URLs)**
- **Frontend**: `https://greencart-logistics.vercel.app`
- **Backend**: `https://greencart-logistics-backend.onrender.com`
- **API Health**: `https://greencart-logistics-backend.onrender.com/health`
- **GitHub**: `https://github.com/YOUR_USERNAME/greencart-logistics-assessment`

### **🔑 Demo Credentials**
- **Admin**: `admin@greencart.com` / `admin123`
- **Manager**: `manager@greencart.com` / `manager123`

### **📊 Dataset Loaded**
- **10 Drivers**: Amit, Priya, Rohit, Neha, Karan, Sneha, Vikram, Anjali, Manoj, Pooja
- **10 Routes**: Various distances (6-25km) with Low/Medium/High traffic levels
- **50 Orders**: Order values ranging from ₹247 to ₹2902

### **✅ Assessment Requirements Met**
- ✅ Frontend: Dashboard, Simulation, Management pages
- ✅ Backend: Node.js + Express + MongoDB + JWT
- ✅ Business Rules: All 6 rules implemented
- ✅ Testing: 25+ unit tests
- ✅ Deployment: Cloud-hosted with proper configuration
- ✅ Documentation: Complete API and deployment docs

---

## 🎉 **Ready to Submit!**

Once all steps are completed, you'll have:
- ✅ Live frontend application
- ✅ Live backend API
- ✅ Cloud-hosted database with your dataset
- ✅ Complete documentation
- ✅ Working demo with test credentials

**Your GreenCart Logistics assessment will be complete and ready for submission!** 🚀
