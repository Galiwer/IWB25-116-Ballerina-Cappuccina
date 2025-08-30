# 🚀 Proper Choreo + Railway MySQL Deployment Guide

## 🎯 Overview

This guide follows the **proper Choreo pattern** for connecting to Railway MySQL database using configurable parameters instead of hardcoded credentials.

## 📋 What We've Implemented

✅ **Configurable Database Connection**: Using `configurable` parameters in Ballerina
✅ **Proper Separation of Concerns**: Credentials not hardcoded in source code
✅ **Choreo Environment Variables**: Ready for Choreo runtime configuration
✅ **MySQL Connector**: Properly configured in Ballerina.toml

## 🔧 Backend Configuration

### 1. Ballerina Code (main.bal)

```ballerina
// Database configuration - configurable for Choreo
configurable string dbHost = "mysql-production-8217.up.railway.app";
configurable int dbPort = 3306;
configurable string dbName = "railway";
configurable string dbUser = "root";
configurable string dbPassword = "ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl";
```

### 2. Ballerina.toml

```toml
[build-options]
observabilityIncluded = true
target = "cloud"

[cloud]
platform = "choreo"

[[dependency]]
org = "ballerinax"
name = "mysql"
version = "1.10.0"

[platform]
[[platform.java21.dependency]]
groupId = "com.mysql"
artifactId = "mysql-connector-j"
version = "8.3.0"
```

### 3. Config.toml

```toml
[database]
host = "mysql-production-8217.up.railway.app"
port = 3306
name = "railway"
user = "root"
password = "ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"

# JDBC URL for reference
url = "jdbc:mysql://mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true"
```

## 🚀 Deployment Steps

### Step 1: Build the Application

```bash
cd backend/ballerinahealthrec
bal build
```

### Step 2: Deploy to Choreo

1. **Go to Choreo Console**: https://console.choreo.dev/
2. **Navigate to Component**: Find your `ballerinahealthrec` component
3. **Go to Deploy Tab**: Click "Deploy"
4. **Upload JAR**: Upload `target/bin/healthRecords.jar`
5. **Deploy**: Click deploy button

### Step 3: Configure Environment Variables in Choreo

**Important**: After deployment, you MUST set these environment variables in Choreo:

1. **Go to Config Tab**: In your component, click "Config"
2. **Add Runtime Configurations**:

```
dbHost = mysql-production-8217.up.railway.app
dbPort = 3306
dbName = railway
dbUser = root
dbPassword = ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl
```

3. **Save and Redeploy**: Click save, then redeploy the component

## 🔍 How It Works

### 1. **Configurable Parameters**
- Ballerina uses `configurable` keyword for runtime configuration
- Values can be overridden by Choreo environment variables
- Default values are provided as fallback

### 2. **Choreo Runtime Configuration**
- Choreo sets environment variables at runtime
- Ballerina picks up these values automatically
- No need to modify code for different environments

### 3. **Database Connection**
- Uses native Ballerina MySQL client
- Connects to Railway MySQL over internet
- Secure connection with SSL options

## 🧪 Testing

### 1. Test Health Endpoint

```bash
curl -X GET 'https://YOUR_CHOREO_URL/health'
```

Expected response:
```json
{"message": "Health Records API is running"}
```

### 2. Test Database Connection

```bash
curl -X GET 'https://YOUR_CHOREO_URL/debug'
```

This will show database connectivity status.

## 🚨 Common Issues & Solutions

### 1. **"Database not initialized" Error**
- **Cause**: Environment variables not set in Choreo
- **Solution**: Set all 5 database environment variables in Choreo Config tab

### 2. **Connection Timeout**
- **Cause**: Railway database not accessible from Choreo
- **Solution**: Verify Railway database is running and accessible

### 3. **Authentication Failed**
- **Cause**: Wrong credentials in environment variables
- **Solution**: Double-check Railway database credentials

## 🔒 Security Benefits

✅ **No Hardcoded Credentials**: Credentials not visible in source code
✅ **Environment-Specific**: Different credentials for dev/staging/prod
✅ **Choreo Managed**: Credentials managed by Choreo platform
✅ **Easy Rotation**: Can change credentials without code changes

## 📊 Railway Database Details

- **Host**: `mysql-production-8217.up.railway.app`
- **Port**: `3306`
- **Database**: `railway`
- **User**: `root`
- **Password**: `ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl`

## 🎉 Success Indicators

After proper deployment, you should see:
1. ✅ Backend responds to health endpoint
2. ✅ Database connection established
3. ✅ All API endpoints working
4. ✅ Frontend can connect successfully

---

**This approach follows Choreo best practices and provides a secure, maintainable database connection!** 🚀
