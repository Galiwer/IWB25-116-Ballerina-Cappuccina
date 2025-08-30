# 🚀 Health Records API - Choreo Deployment

Your Health Records API is now ready for deployment to Choreo!

## 📁 Files Created/Modified

- ✅ `Ballerina.toml` - Updated with Choreo cloud configuration
- ✅ `Choreo.toml` - Choreo-specific deployment settings
- ✅ `main.bal` - Enhanced environment variable handling
- ✅ `CHOREO_DEPLOYMENT.md` - Complete deployment guide
- ✅ `deploy-to-choreo.sh` - Automated deployment script
- ✅ `.dockerignore` - Optimized for Choreo deployment

## 🎯 Quick Start

### Option 1: Using Choreo Console (Recommended)
1. Go to https://console.choreo.dev
2. Create a new project
3. Create a new Ballerina service component
4. Connect your Git repository
5. Set source directory to `backend/ballerinahealthrec`
6. Configure environment variables
7. Deploy!

### Option 2: Using CLI
```bash
# Make sure you're in the backend/ballerinahealthrec directory
cd backend/ballerinahealthrec

# Run the deployment script
./deploy-to-choreo.sh
```

## 🔧 Environment Variables

Set these in Choreo console:

```bash
DATABASE_URL=jdbc:mysql://your-mysql-host:3306/babadb?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
DATABASE_USER=your-username
DATABASE_PASSWORD=your-password
```

## 🧪 Test Your Deployment

Once deployed, test these endpoints:

```bash
# Health check
curl https://your-choreo-url/health

# Get user profile
curl https://your-choreo-url/health/getUserProfile?userId=your-user-id

# Get BMI records
curl https://your-choreo-url/health/getBmiRecords?userId=your-user-id
```

## 📚 Documentation

- 📖 Complete guide: `CHOREO_DEPLOYMENT.md`
- 🔧 Configuration: `Choreo.toml`
- 🐳 Docker: `Dockerfile`
- 📦 Build: `Ballerina.toml`

## 🆘 Support

- Choreo Docs: https://docs.choreo.dev
- Choreo Community: https://community.choreo.dev
- Ballerina Docs: https://ballerina.io/learn/

---

**Happy Deploying! 🎉**
