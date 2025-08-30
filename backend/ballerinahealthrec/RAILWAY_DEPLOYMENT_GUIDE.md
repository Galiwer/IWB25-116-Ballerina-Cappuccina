# 🚂 Railway Deployment Guide for Health Records API

## 🎯 Overview

This guide will help you deploy your Ballerina Health Records API to Railway using Docker.

## 📋 Prerequisites

- ✅ Railway account
- ✅ Git repository with your code
- ✅ Railway CLI (optional)

## 🐳 Docker Configuration

### Dockerfile.railway
The `Dockerfile.railway` is optimized for Railway deployment with:

- ✅ **Multi-stage build** for smaller image size
- ✅ **Railway-specific port configuration** using `$PORT` environment variable
- ✅ **Health checks** for monitoring
- ✅ **Ballerina 2201.12.7** (matches your project version)

### Key Features
```dockerfile
# Railway-specific configuration
ENV PORT=9090
EXPOSE $PORT

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:$PORT/health || exit 1
```

## 🚀 Deployment Steps

### Step 1: Prepare Your Repository

1. **Ensure all files are committed**:
   ```bash
   git add .
   git commit -m "Add Railway deployment configuration"
   git push origin main
   ```

2. **Verify these files exist**:
   - ✅ `Dockerfile.railway`
   - ✅ `railway.toml`
   - ✅ `Ballerina.toml`
   - ✅ `main.bal`

### Step 2: Deploy to Railway

#### Option A: Using Railway Dashboard (Recommended)

1. **Go to Railway Dashboard**: https://railway.app/dashboard
2. **Create New Project** → **Deploy from GitHub repo**
3. **Select your repository**
4. **Configure Environment Variables** (see below)
5. **Deploy**

#### Option B: Using Railway CLI

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Link to your project
railway link

# Deploy
railway up
```

### Step 3: Configure Environment Variables

Set these environment variables in Railway dashboard:

```bash
# Database Configuration
DATABASE_URL=mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true

# Individual Database Variables (alternative)
DATABASE_HOST=mysql-production-8217.up.railway.app
DATABASE_PORT=3306
DATABASE_NAME=railway
DATABASE_USER=root
DATABASE_PASSWORD=ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl

# Application Configuration
PORT=9090
```

### Step 4: Configure Your Frontend

Update your Vercel frontend to use the Railway backend:

```bash
# In Vercel Environment Variables
Name: VITE_API_BASE_URL
Value: https://your-railway-app-url.railway.app/health
Environment: Production, Preview, Development
```

## 🧪 Testing Your Deployment

### Test Railway Backend

```bash
# Health check
curl https://your-railway-app-url.railway.app/health

# Test API endpoints
curl https://your-railway-app-url.railway.app/health/debug

# Test signup
curl -X POST https://your-railway-app-url.railway.app/health/signup \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "TestPass123!",
    "gender": "Male",
    "dateOfBirth": "1990-01-01",
    "phoneNumber": "1234567890"
  }'
```

### Test Frontend Integration

1. **Visit your Vercel frontend**: https://babapotha.vercel.app
2. **Test signup/login** functionality
3. **Test all features** (BMI, vaccines, appointments)
4. **Check browser console** for any errors

## 📊 Monitoring

### Railway Dashboard
- **Deployment Logs**: Monitor build and deployment status
- **Application Logs**: Check runtime logs
- **Metrics**: CPU, memory, and network usage
- **Health Checks**: Automatic health monitoring

### Health Check Endpoint
Your application provides a health check endpoint:
```
GET /health
```

## 🔍 Troubleshooting

### Build Issues

**Error**: Docker build fails
**Solutions**:
1. Check `Dockerfile.railway` syntax
2. Verify Ballerina version matches `Ballerina.toml`
3. Check Railway build logs

### Runtime Issues

**Error**: Application fails to start
**Solutions**:
1. Check environment variables are set correctly
2. Verify database connection
3. Check application logs in Railway dashboard

### Database Issues

**Error**: Database connection fails
**Solutions**:
1. Verify Railway MySQL service is running
2. Check database credentials
3. Ensure database "railway" exists

### Port Issues

**Error**: Port binding fails
**Solutions**:
1. Railway automatically sets `PORT` environment variable
2. Application uses `$PORT` in Dockerfile
3. Check `railway.toml` configuration

## 🔧 Configuration Files

### railway.toml
```toml
[build]
builder = "DOCKERFILE"
dockerfilePath = "Dockerfile.railway"

[deploy]
startCommand = "java -jar healthRecords.jar"
healthcheckPath = "/health"
healthcheckTimeout = 300
restartPolicyType = "ON_FAILURE"
restartPolicyMaxRetries = 3

[[services]]
name = "health-records-api"
port = 9090
```

### Dockerfile.railway
- Multi-stage build for optimization
- Railway-specific port configuration
- Health checks for monitoring
- Java 21 runtime

## 📈 Performance Optimization

### Railway Optimizations
- ✅ **Multi-stage Docker build** for smaller images
- ✅ **Health checks** for automatic monitoring
- ✅ **Restart policies** for reliability
- ✅ **Environment variable configuration**

### Application Optimizations
- ✅ **Connection pooling** for database
- ✅ **CORS configuration** for frontend
- ✅ **Error handling** and logging
- ✅ **Automatic table creation**

## 🎉 Success Checklist

- [ ] Repository contains `Dockerfile.railway`
- [ ] Repository contains `railway.toml`
- [ ] Environment variables set in Railway
- [ ] Application deployed successfully
- [ ] Health check endpoint responding
- [ ] Database connection working
- [ ] Frontend updated with Railway URL
- [ ] All features tested and working

## 🆘 Support

- **Railway Documentation**: https://docs.railway.app
- **Railway Community**: https://community.railway.app
- **Ballerina Documentation**: https://ballerina.io/learn/

---

## 🚀 Ready for Railway!

Your Health Records API is now configured for Railway deployment with Docker!

**Next Steps**:
1. Deploy to Railway using the dashboard or CLI
2. Set environment variables
3. Update frontend to use Railway backend URL
4. Test all features

Your application will automatically create all necessary database tables and be ready for production use! 🎉
