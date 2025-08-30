# 🔧 Fix Database Initialization in Choreo

## 🚨 Current Issue

Your Choreo backend is responding with:
```json
{"message":"Database not initialized"}
```

This means the database connection environment variables are not set correctly in Choreo.

## 🔧 Solution Steps

### Step 1: Set Environment Variables in Choreo

1. **Go to Choreo Console**: https://console.choreo.dev
2. **Find your API component** (ballerinahealthrec)
3. **Go to Settings** → **Environment Variables**
4. **Add these environment variables**:

```bash
# Railway MySQL Database Configuration
DATABASE_URL="mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@mysql-production-8217.up.railway.app:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true"

# Individual Database Parameters
DATABASE_HOST="mysql-production-8217.up.railway.app"
DATABASE_PORT="3306"
DATABASE_NAME="railway"
DATABASE_USER="root"
DATABASE_PASSWORD="ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
```

### Step 2: Redeploy Your Component

After setting the environment variables:
1. **Save** the environment variables
2. **Redeploy** your Choreo component
3. **Wait** for deployment to complete
4. **Check** the deployment logs for any errors

### Step 3: Test Database Connection

Test the health endpoint:
```bash
curl -X GET "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0" \
  -H "Test-Key: YOUR_TEST_KEY"
```

Expected response:
```json
{"message":"Health Records API is running"}
```

### Step 4: Test Signup

Test the signup endpoint:
```bash
curl -X POST "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/signup" \
  -H "Content-Type: application/json" \
  -H "Test-Key: YOUR_TEST_KEY" \
  -d '{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "password": "Password123!",
    "gender": "Male",
    "dateOfBirth": "1990-05-15",
    "phoneNumber": "+1234567890"
  }'
```

Expected response (success):
```json
{
  "message": "User registered successfully",
  "userId": "generated-user-id",
  "name": "John Doe",
  "email": "john.doe@example.com"
}
```

## 🔍 Troubleshooting

### If Still Getting "Database not initialized"

1. **Check Environment Variables**:
   - Ensure all variables are set correctly
   - Check for typos in variable names
   - Verify the Railway database credentials

2. **Check Railway Database**:
   - Ensure Railway MySQL service is running
   - Verify the database credentials are correct
   - Check if the database "railway" exists

3. **Check Choreo Logs**:
   - Go to Choreo console
   - Check the application logs
   - Look for database connection errors

### Common Issues

1. **Wrong Database URL Format**:
   - Ensure the URL includes all required parameters
   - Check that the host is correct: `mysql-production-8217.up.railway.app`

2. **Missing Environment Variables**:
   - All 5 environment variables must be set
   - Variable names are case-sensitive

3. **Database Credentials**:
   - Verify username is "root"
   - Verify password is correct
   - Check if Railway database is accessible

## 📋 Environment Variables Checklist

- [ ] `DATABASE_URL` - Complete MySQL connection string
- [ ] `DATABASE_HOST` - Railway MySQL host
- [ ] `DATABASE_PORT` - Port 3306
- [ ] `DATABASE_NAME` - Database name "railway"
- [ ] `DATABASE_USER` - Username "root"
- [ ] `DATABASE_PASSWORD` - Correct password

## 🧪 Testing Commands

### Test Health Endpoint
```bash
curl -X GET "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0"
```

### Test Signup Endpoint
```bash
curl -X POST "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/signup" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Test",
    "lastName": "User",
    "email": "test@example.com",
    "password": "Test123!",
    "gender": "Male",
    "dateOfBirth": "1990-01-01",
    "phoneNumber": "1234567890"
  }'
```

### Test Login Endpoint
```bash
curl -X POST "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test123!"
  }'
```

## 🎯 Expected Results

After fixing the environment variables:

1. **Health Endpoint**: Should return `{"message":"Health Records API is running"}`
2. **Signup Endpoint**: Should create a new user successfully
3. **Login Endpoint**: Should authenticate existing users
4. **Database**: Should be automatically initialized with required tables

## 🚀 Next Steps

1. **Set environment variables** in Choreo console
2. **Redeploy** the component
3. **Test** the endpoints
4. **Configure frontend** to use the working backend
5. **Test full application** at https://babapotha.vercel.app

---

## ✅ Success Indicators

- ✅ Health endpoint responds correctly
- ✅ Signup creates users successfully
- ✅ Login authenticates users
- ✅ No "Database not initialized" errors
- ✅ All API endpoints working

