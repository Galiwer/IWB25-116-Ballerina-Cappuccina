# Complete Deployment Guide - Health Records App

This guide will help you deploy both the backend and frontend of your Health Records application.

## 🎯 **Current Status**

- ✅ **Backend**: Built successfully, ready for Choreo deployment
- ✅ **Frontend**: Built successfully, configured for Choreo backend
- ❌ **Choreo Backend**: Needs environment variables configuration
- ❌ **Vercel Frontend**: Needs to be redeployed with new configuration

## 🚀 **Step 1: Deploy Backend to Choreo**

### 1.1 Go to Choreo Console
- Visit: https://console.choreo.dev/
- Navigate to your `ballerinahealthrec` component

### 1.2 Deploy the Updated Backend
1. **Go to 'Deploy' tab**
2. **Upload the new JAR file**: `backend/ballerinahealthrec/target/bin/healthRecords.jar`
3. **Wait for deployment to complete**

### 1.3 Configure Environment Variables
1. **Go to 'Config' tab**
2. **Add these environment variables**:
   ```
   DATABASE_HOST=mysql-production-8217.up.railway.app
   DATABASE_PORT=3306
   DATABASE_NAME=railway
   DATABASE_USER=root
   DATABASE_PASSWORD=ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl
   ```
3. **Click 'Save'**
4. **Redeploy the component**

### 1.4 Test the Backend
```bash
curl -X GET 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health'
```

Expected response: `{"message": "Health Records API is running"}`

## 🌐 **Step 2: Deploy Frontend to Vercel**

### 2.1 Deploy to Vercel
1. **Go to Vercel Dashboard**: https://vercel.com/dashboard
2. **Select your project**: `babapotha`
3. **Deploy the updated frontend**:
   ```bash
   cd frontend/babaf
   vercel --prod
   ```

### 2.2 Verify Frontend Configuration
The frontend is now configured to:
- **Default API URL**: `https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0`
- **API Key**: Automatically included in requests
- **CORS**: Configured to allow Vercel domain

## 🧪 **Step 3: Test the Complete Application**

### 3.1 Test Backend Health
```bash
curl -X GET 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health'
```

### 3.2 Test User Registration
```bash
curl -X POST 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/signup' \
  -H 'Content-Type: application/json' \
  -H 'Test-Key: eyJraWQiOiJnYXRld2F5X2NlcnRpZmljYXRlX2FsaWFzIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI0NTczM2E0NC0xMWQ1LTQ2ZGUtODQzOC0wMTBiNDY0ZGExZmZAY2FyYm9uLnN1cGVyIiwiYXVkIjoiY2hvcmVvOmRlcGxveW1lbnQ6c2FuZGJveCIsIm9yZ2FuaXphdGlvbiI6eyJ1dWlkIjoiMzE2ZGRhNDAtOWI1NS00NWVmLWJjOGUtODIwNGI2ODhkYmVhIn0sImlzcyI6Imh0dHBzOlwvXC9zdHMuY2hvcmVvLmRldjo0NDNcL2FwaVwvYW1cL3B1Ymxpc2hlclwvdjJcL2FwaXNcL2ludGVybmFsLWtleSIsImtleXR5cGUiOiJTQU5EQk9YIiwic3Vic2NyaWJlZEFQSXMiOlt7InN1YnNjcmliZXJUZW5hbnREb21haW4iOm51bGwsIm5hbWUiOiJiYWxsZXJpbmFoZWFsdGhyZWMgLSBIZWFsdGgiLCJjb250ZXh0IjoiXC8zMTZkZGE0MC05YjU1LTQ1ZWYtYmM4ZS04MjA0YjY4OGRiZWFcL2RlZmF1bHRcL2JhbGxlcmluYWhlYWx0aHJlY1wvdjEuMCIsInB1Ymxpc2hlciI6ImNob3Jlb19wcm9kX2FwaW1fYWRtaW4iLCJ2ZXJzaW9uIjoidjEuMCIsInN1YnNjcmlwdGlvblRpZXIiOm51bGx9XSwiZXhwIjoxNzU2NTU4MzQzLCJ0b2tlbl90eXBlIjoiSW50ZXJuYWxLZXkiLCJpYXQiOjE3NTY1NTc3NDMsImp0aSI6IjI3Mjk3Yjc4LWJiZmUtNDcxMC1iOGY2LTI5YzZmZjlmZWZhMSJ9.DjrYpVwR2MBf-RZYT4JJEuf0OCTqusN8l9x8j6bzuYLp8ZlXsWL2DAIfjUrKEYaB5On7fQ6ISUV1ca0U8Jd023WuPM_Dn-sivy4tA9ltxMXmW--_V8rcvaiWjkhDd_M7YCEDOgTm0g-F99Aewi8jjU5QsZlLcp9NpHfJH4BCvM4EgLisXebrlDcp33raKy4b56QLKWgrDTr53KiPBqhwSM1_PAK1nzHG4I8L6LcO6K2ar9m0Qv0ZbQYdDPN577-bhjUS7ji4PdO9Vetn28DuE3v9SGnxiZzI307zWkRgHmFBsTig_d253P1V_JkHJgW12nHORpiqRxBA2mjmRaCc5U3BO8YYudgpss-bVljiasraqDcD7bBOehsFtraWxCE8RcD_mKcMOdJ0oAkTZOWzkEJYUctRKi9rEU34bYF9STAUX9f4lqaHLcRyYyKl6hx5hlL2nC6pigshL3bY-356Qf-PRkWX-N3On0FBtwwzpaOuzvCHOJ-sLhoHc88v6u5qG1Bh4kNI-rqZA5K_gpfQ8hZIcT7LwEUUyFdV6tPULC0yRTvyiLObnuue6JDTrt285ignVuYH-RleyeZpqnjqwjHCcGPDg8TKLdJ_Rz823qKeNME7ikUTfRkoFW2KRrCP9Bbt6t_AFDKqKdquY8L3Es4_Ef-gFWYHcUFIsvdZnsg' \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "Password123!",
    "gender": "Male",
    "dateOfBirth": "1990-01-01",
    "phoneNumber": "+1234567890"
  }'
```

### 3.3 Test Frontend
1. **Visit your Vercel app**: https://babapotha.vercel.app
2. **Try to sign up** with a new user
3. **Test all features**: BMI, Vaccines, Appointments, etc.

## 🔧 **Troubleshooting**

### Backend Issues

**"Database not initialized" Error**
- Check environment variables in Choreo Console
- Ensure all 5 database variables are set correctly
- Redeploy after setting variables

**Connection Issues**
- Verify Railway database is running
- Check database credentials
- Ensure Choreo can reach Railway

### Frontend Issues

**CORS Errors**
- Backend is configured to allow `https://babapotha.vercel.app`
- Check browser console for CORS errors
- Verify API key is being sent correctly

**API Connection Errors**
- Check if Choreo backend is responding
- Verify the API URL is correct
- Test with curl commands first

## 📊 **Monitoring**

### Backend Monitoring
- **Choreo Console**: Check logs and metrics
- **Health Endpoint**: Monitor `/health` endpoint
- **Database**: Check Railway database status

### Frontend Monitoring
- **Vercel Analytics**: Monitor user interactions
- **Browser Console**: Check for JavaScript errors
- **Network Tab**: Monitor API requests

## 🔐 **Security Notes**

1. **API Keys**: The Choreo API key is included in the frontend code
2. **Database**: Railway provides SSL connections
3. **CORS**: Configured to allow only your Vercel domain
4. **Environment Variables**: Sensitive data is in Choreo environment variables

## 🎉 **Success Indicators**

✅ **Backend**: Health endpoint returns `{"message": "Health Records API is running"}`
✅ **Database**: User registration works without errors
✅ **Frontend**: Can sign up and access all features
✅ **Integration**: Frontend can communicate with backend

## 📞 **Support**

If you encounter issues:
1. Check Choreo console logs
2. Verify all environment variables
3. Test database connection manually
4. Check Railway database status
5. Monitor Vercel deployment logs
