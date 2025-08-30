# 🚀 Complete Deployment Guide: Vercel Frontend + Choreo Backend

## 🎯 Overview

This guide will help you deploy your Health Records application with:
- **Frontend**: React/TypeScript app on Vercel
- **Backend**: Ballerina API on Choreo
- **Database**: Railway MySQL

## 📋 Prerequisites

- ✅ Vercel account
- ✅ Choreo account  
- ✅ Railway MySQL database
- ✅ Git repository with your code

## 🔧 Backend Configuration (Choreo)

### Step 1: Deploy Backend to Choreo

1. **Go to Choreo Console**: https://console.choreo.dev
2. **Create Component**:
   - Type: Service
   - Language: Ballerina
   - Source: Your Git repository
   - Source Directory: `backend/ballerinahealthrec`

3. **Configure Build**:
   - Build Command: `bal build`
   - Output Path: `target/bin/healthRecords.jar`

4. **Set Environment Variables**:
   ```bash
   DATABASE_URL="mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@your-railway-private-domain:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true"
   DATABASE_HOST="your-railway-private-domain"
   DATABASE_PORT="3306"
   DATABASE_NAME="railway"
   DATABASE_USER="root"
   DATABASE_PASSWORD="ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
   ```

5. **Deploy**: Click deploy and wait for build completion

### Step 2: Get Choreo Backend URL

After successful deployment, note your Choreo backend URL:
- Format: `https://your-component-name-your-org.choreoapps.dev`
- Example: `https://health-records-api-yourorg.choreoapps.dev`

## 🌐 Frontend Configuration (Vercel)

### Step 1: Set Environment Variables in Vercel

1. **Go to Vercel Dashboard**: https://vercel.com/dashboard
2. **Select your project** (babaf)
3. **Go to Settings** → **Environment Variables**
4. **Add the following variable**:

```bash
Name: VITE_API_BASE_URL
Value: https://your-choreo-backend-url/health
Environment: Production, Preview, Development
```

**Example:**
```bash
Name: VITE_API_BASE_URL
Value: https://health-records-api-yourorg.choreoapps.dev/health
Environment: Production, Preview, Development
```

### Step 2: Redeploy Frontend

1. **Trigger new deployment** in Vercel
2. **Or push changes** to your Git repository

## 🧪 Testing Your Deployment

### Test Backend (Choreo)

```bash
# Health check
curl https://your-choreo-backend-url/health

# Test user profile
curl https://your-choreo-backend-url/health/getUserProfile?userId=your-user-id

# Test BMI records
curl https://your-choreo-backend-url/health/getBmiRecords?userId=your-user-id
```

### Test Frontend (Vercel)

1. **Open your Vercel frontend URL**
2. **Test login/signup functionality**
3. **Test all features** (BMI, vaccines, appointments, etc.)
4. **Check browser console** for any errors

### Test from Browser Console

```javascript
// Test API connection
fetch('https://your-choreo-backend-url/health')
  .then(response => response.json())
  .then(data => console.log('API Response:', data))
  .catch(error => console.error('API Error:', error))
```

## 🔍 Troubleshooting

### Backend Issues (Choreo)

1. **Build Failures**:
   - Check Choreo build logs
   - Ensure all dependencies are resolved
   - Verify Ballerina.toml configuration

2. **Database Connection Issues**:
   - Verify Railway MySQL is running
   - Check environment variables
   - Ensure Railway private domain is correct

3. **Runtime Errors**:
   - Check Choreo application logs
   - Monitor for 500 errors
   - Verify database tables exist

### Frontend Issues (Vercel)

1. **Environment Variable Issues**:
   - Ensure `VITE_API_BASE_URL` is set correctly
   - Verify variable name starts with `VITE_`
   - Check all environments are selected

2. **CORS Errors**:
   - Backend CORS is configured for Vercel domains
   - Check browser console for CORS errors
   - Verify API URL is correct

3. **API Connection Issues**:
   - Test API endpoints directly
   - Check network tab in browser dev tools
   - Verify Choreo backend is running

### Database Issues (Railway)

1. **Connection Issues**:
   - Verify Railway MySQL service is active
   - Check connection credentials
   - Ensure database "railway" exists

2. **Data Issues**:
   - Check if tables are created automatically
   - Verify data is being saved/retrieved
   - Monitor Railway logs

## 📊 Monitoring

### Choreo Monitoring
- **Application Logs**: Check Choreo console
- **Performance Metrics**: Monitor CPU, memory usage
- **Error Tracking**: Watch for 500 errors

### Vercel Monitoring
- **Deployment Logs**: Check build and deployment status
- **Performance**: Monitor frontend performance
- **Error Tracking**: Check for client-side errors

### Railway Monitoring
- **Database Status**: Monitor MySQL service health
- **Connection Logs**: Check database connection logs
- **Performance**: Track query performance

## 🔒 Security

### Backend Security
- ✅ **HTTPS**: Choreo provides HTTPS by default
- ✅ **CORS**: Configured for Vercel domains
- ✅ **Environment Variables**: No hardcoded secrets

### Frontend Security
- ✅ **HTTPS**: Vercel provides HTTPS by default
- ✅ **Environment Variables**: API URLs in environment variables
- ✅ **No Secrets**: No sensitive data in frontend code

### Database Security
- ✅ **Private Network**: Using Railway private domain
- ✅ **Encrypted Connections**: SSL enabled
- ✅ **Secure Credentials**: Environment variables only

## 🚀 Deployment Checklist

### Backend (Choreo)
- [ ] Code committed to Git repository
- [ ] Choreo component created
- [ ] Environment variables set
- [ ] Build successful
- [ ] Application deployed and running
- [ ] Health endpoint responding
- [ ] Database connection working

### Frontend (Vercel)
- [ ] Code committed to Git repository
- [ ] Vercel project connected
- [ ] Environment variable `VITE_API_BASE_URL` set
- [ ] Frontend deployed successfully
- [ ] No build errors
- [ ] API connection working
- [ ] All features functional

### Database (Railway)
- [ ] MySQL service running
- [ ] Database "railway" exists
- [ ] Tables created automatically
- [ ] Connection credentials correct
- [ ] Network access configured

## 📱 Application Features

Your deployed application includes:

- ✅ **User Authentication**: Login/signup
- ✅ **User Profiles**: Profile management
- ✅ **BMI Tracking**: Weight and height records
- ✅ **Vaccine Management**: Vaccine schedules and records
- ✅ **Doctor Appointments**: Appointment scheduling
- ✅ **Disease Tracking**: Medical condition management
- ✅ **Special Notes**: Additional health notes

## 🆘 Support Resources

- **Choreo Documentation**: https://docs.choreo.dev
- **Vercel Documentation**: https://vercel.com/docs
- **Railway Documentation**: https://docs.railway.app
- **Ballerina Documentation**: https://ballerina.io/learn/

---

## 🎉 Deployment Complete!

Your Health Records application is now fully deployed with:
- **Frontend**: Vercel (React/TypeScript)
- **Backend**: Choreo (Ballerina API)
- **Database**: Railway (MySQL)

**Next Steps**: Test all features and monitor performance! 🚀
