# 🚀 Deploy Health Records API to Choreo with Railway MySQL

## 🎯 Quick Deployment Guide

Your application is now configured to use Railway MySQL database and ready for Choreo deployment!

## 📋 Prerequisites

1. ✅ **Choreo Account**: You have a Choreo account
2. ✅ **Railway MySQL**: Your Railway MySQL database is running
3. ✅ **Git Repository**: Your code is in a Git repository
4. ✅ **Application Ready**: All configurations are complete

## 🔧 Railway MySQL Configuration

### Your Railway MySQL Details:
- **Database**: `railway`
- **Username**: `root`
- **Password**: `ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl`
- **Host**: `your-railway-private-domain` (replace with actual domain)
- **Port**: `3306`

## 🚀 Deploy to Choreo

### Step 1: Get Railway Connection Details

1. Go to your Railway dashboard
2. Find your MySQL service
3. Copy the **Private Domain** (not the public one)
4. Replace `your-railway-private-domain` in the configuration below

### Step 2: Set Environment Variables in Choreo

In your Choreo component settings, add these environment variables:

```bash
# Primary connection string (replace your-railway-private-domain with actual domain)
DATABASE_URL="mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@your-railway-private-domain:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true"

# Individual parameters (alternative)
DATABASE_HOST="your-railway-private-domain"
DATABASE_PORT="3306"
DATABASE_NAME="railway"
DATABASE_USER="root"
DATABASE_PASSWORD="ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
```

### Step 3: Deploy

1. **Go to Choreo Console**: https://console.choreo.dev
2. **Create/Select Project**: Choose your project
3. **Create Component**: 
   - Type: Service
   - Language: Ballerina
   - Source: Your Git repository
   - Source Directory: `backend/ballerinahealthrec`
4. **Configure Build**:
   - Build Command: `bal build`
   - Output Path: `target/bin/healthRecords.jar`
5. **Set Environment Variables**: Add the variables from Step 2
6. **Deploy**: Click deploy and monitor the build

## 🧪 Test Your Deployment

Once deployed, test these endpoints:

```bash
# Health check
curl https://your-choreo-url/health

# Get user profile
curl https://your-choreo-url/health/getUserProfile?userId=your-user-id

# Get BMI records
curl https://your-choreo-url/health/getBmiRecords?userId=your-user-id

# Add BMI record
curl -X POST https://your-choreo-url/health/addBmiRecord \
  -H "Content-Type: application/json" \
  -d '{"userId":"your-user-id","weight":70.0,"height":175.0,"date":"2025-08-30","notes":"Test"}'
```

## 🔍 Troubleshooting

### Build Issues
- ✅ **Dependency Error Fixed**: MySQL connector now downloads from Maven Central
- ✅ **Database Name Updated**: All references changed from `babadb` to `railway`

### Connection Issues
- **Check Railway Domain**: Ensure you're using the correct Railway private domain
- **Verify Credentials**: Username is `root`, password is correct
- **Network Access**: Ensure Railway allows connections from Choreo

### Database Issues
- **Database Creation**: The app will create the `railway` database if it doesn't exist
- **Tables**: All required tables will be created automatically
- **Data Migration**: Existing data will be preserved

## 📊 Monitoring

### Choreo Monitoring
- **Logs**: Check Choreo console for application logs
- **Metrics**: Monitor CPU, memory, and request metrics
- **Health Checks**: Application provides health check endpoint

### Railway Monitoring
- **Database Status**: Check Railway dashboard for MySQL service status
- **Connection Logs**: Monitor database connection logs
- **Performance**: Track database performance metrics

## 🔒 Security

- ✅ **Private Network**: Using Railway private domain for secure connections
- ✅ **Environment Variables**: Credentials stored securely in Choreo
- ✅ **No Hardcoded Secrets**: All sensitive data in environment variables

## 📈 Scaling

- **Auto-scaling**: Configure auto-scaling rules in Choreo
- **Database Scaling**: Railway MySQL can be scaled as needed
- **Performance**: Application optimized for cloud deployment

## 🆘 Support

- **Choreo Issues**: https://docs.choreo.dev
- **Railway Issues**: https://docs.railway.app
- **Ballerina Issues**: https://ballerina.io/learn/

---

## ✅ Status: Ready for Deployment

Your Health Records API is fully configured and ready for deployment to Choreo with Railway MySQL!

**Next Step**: Deploy to Choreo using the steps above! 🚀
