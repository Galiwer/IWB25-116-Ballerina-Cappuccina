# 🚀 Deployment Options for Health Records API

## 🎯 Available Deployment Platforms

Your Health Records API can be deployed on multiple platforms. Choose the one that best fits your needs:

## 1. 🚂 Railway (Recommended)

### **Why Railway?**
- ✅ **Easy deployment** with Docker
- ✅ **Built-in MySQL database** support
- ✅ **Automatic scaling** and monitoring
- ✅ **Free tier** available
- ✅ **Git integration** for automatic deployments

### **Files Created**
- ✅ `Dockerfile.railway` - Optimized Docker configuration
- ✅ `railway.toml` - Railway deployment configuration
- ✅ `RAILWAY_DEPLOYMENT_GUIDE.md` - Complete deployment guide
- ✅ `deploy-to-railway.sh` - Automated deployment script

### **Quick Deploy**
```bash
# Option 1: Using Railway Dashboard
# 1. Go to https://railway.app/dashboard
# 2. Create New Project → Deploy from GitHub repo
# 3. Select your repository
# 4. Set environment variables
# 5. Deploy

# Option 2: Using CLI
./deploy-to-railway.sh
```

### **Environment Variables**
```bash
DATABASE_URL=mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
PORT=9090
```

## 2. ☁️ Choreo

### **Why Choreo?**
- ✅ **Native Ballerina support**
- ✅ **Built-in observability**
- ✅ **Enterprise-grade** platform
- ✅ **Advanced monitoring** and analytics

### **Files Created**
- ✅ `Ballerina.toml` - Cloud-optimized configuration
- ✅ `Choreo.toml` - Choreo-specific settings
- ✅ `CHOREO_DEPLOYMENT.md` - Complete deployment guide
- ✅ `Config.toml` - Fixed configuration file

### **Quick Deploy**
```bash
# 1. Go to https://console.choreo.dev
# 2. Create Ballerina service component
# 3. Set source directory to backend/ballerinahealthrec
# 4. Configure environment variables
# 5. Deploy
```

### **Environment Variables**
```bash
DATABASE_URL=mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
DATABASE_HOST=mysql-production-8217.up.railway.app
DATABASE_PORT=3306
DATABASE_NAME=railway
DATABASE_USER=root
DATABASE_PASSWORD=ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl
```

## 3. 🐳 Docker (Any Platform)

### **Why Docker?**
- ✅ **Platform agnostic**
- ✅ **Easy to deploy anywhere**
- ✅ **Consistent environment**
- ✅ **Scalable** and portable

### **Files Created**
- ✅ `Dockerfile` - Standard Docker configuration
- ✅ `DOCKER_DEPLOYMENT.md` - Docker deployment guide

### **Quick Deploy**
```bash
# Build Docker image
docker build -t health-records-api .

# Run container
docker run -p 9090:9090 \
  -e DATABASE_URL="mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true" \
  health-records-api
```

## 4. 🏠 Local Development

### **Why Local?**
- ✅ **Fast development** cycle
- ✅ **Easy debugging**
- ✅ **No deployment** needed
- ✅ **Full control** over environment

### **Quick Start**
```bash
# Install Ballerina
# Build and run
bal build
bal run
```

## 🌐 Frontend Configuration

### **Vercel Frontend**
Your frontend is deployed at: https://babapotha.vercel.app

### **Environment Variable**
Set this in Vercel to connect to your backend:

```bash
# For Railway Backend
VITE_API_BASE_URL=https://your-railway-app-url.railway.app/health

# For Choreo Backend
VITE_API_BASE_URL=https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health

# For Local Backend
VITE_API_BASE_URL=http://localhost:9090/health
```

## 📊 Comparison Table

| Platform | Ease of Use | Cost | Performance | Monitoring | Database |
|----------|-------------|------|-------------|------------|----------|
| **Railway** | ⭐⭐⭐⭐⭐ | Free tier | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Built-in MySQL |
| **Choreo** | ⭐⭐⭐⭐ | Free tier | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | External MySQL |
| **Docker** | ⭐⭐⭐ | Varies | ⭐⭐⭐⭐ | ⭐⭐⭐ | External |
| **Local** | ⭐⭐⭐⭐⭐ | Free | ⭐⭐⭐ | ⭐⭐ | External |

## 🎯 Recommendation

### **For Production: Railway**
- Best balance of ease and features
- Built-in MySQL database
- Automatic deployments
- Good monitoring

### **For Enterprise: Choreo**
- Native Ballerina support
- Advanced observability
- Enterprise features
- Professional support

### **For Development: Local**
- Fastest development cycle
- Full control
- Easy debugging
- No deployment overhead

## 🚀 Quick Start Guide

### **Option 1: Railway (Recommended)**
1. Go to https://railway.app/dashboard
2. Create new project from GitHub
3. Set environment variables
4. Deploy

### **Option 2: Choreo**
1. Go to https://console.choreo.dev
2. Create Ballerina service
3. Configure environment variables
4. Deploy

### **Option 3: Docker**
1. Build image: `docker build -t health-records-api .`
2. Run container with environment variables
3. Access at http://localhost:9090

## 🔧 Common Configuration

### **Database (Railway MySQL)**
- **Host**: mysql-production-8217.up.railway.app
- **Database**: railway
- **User**: root
- **Password**: ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl

### **Application**
- **Port**: 9090
- **Health Check**: `/health`
- **API Base**: `/health/*`

### **Features**
- ✅ **User Authentication**: Login/signup
- ✅ **BMI Tracking**: Weight and height records
- ✅ **Vaccine Management**: Vaccine schedules
- ✅ **Doctor Appointments**: Appointment scheduling
- ✅ **Disease Tracking**: Medical conditions
- ✅ **Special Notes**: Additional health notes

## 🎉 Ready to Deploy!

Choose your preferred platform and follow the specific deployment guide. All platforms will automatically create the necessary database tables and be ready for production use!

**Recommended**: Start with Railway for the easiest deployment experience! 🚂
