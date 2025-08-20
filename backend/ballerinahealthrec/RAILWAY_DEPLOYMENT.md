# Railway Deployment Guide

## Prerequisites
1. Railway account (https://railway.app)
2. MongoDB Atlas database (already configured)

## Deployment Steps

### 1. Connect Your Repository
1. Go to Railway dashboard
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Choose your repository
5. Set the root directory to `backend/ballerinahealthrec`

### 2. Environment Variables (Auto-configured)
The following environment variables are already configured in `railway.toml`:
```
MONGODB_URI=mongodb+srv://himashavalantina55:Hima%401234@cluster0.ktheqad.mongodb.net/healthDB?retryWrites=true&w=majority
PORT=9090
BALLERINA_DISTRIBUTION=2201.12.7
```

### 3. Deploy
1. Railway will automatically detect the Ballerina project
2. It will use the `nixpacks.toml` configuration to build and deploy
3. The service will be available at the provided Railway URL

### 4. Update Frontend Configuration
Update your frontend's API base URL to point to your Railway deployment:
```javascript
const API_BASE_URL = 'https://your-railway-app.railway.app';
```

## Configuration Files

### railway.toml
- Configures the build and deployment process
- Sets health check endpoint to `/health`
- Configures restart policy
- **Pre-configured with MongoDB connection string**

### nixpacks.toml
- Specifies Ballerina, OpenJDK, and curl as dependencies
- Uses custom build script for better error handling
- Defines build and start commands

### Ballerina.toml
- Project configuration and dependencies
- MongoDB connector version 5.1.0
- Ballerina distribution 2201.12.7

### build.sh
- Custom build script for Railway
- Provides better error reporting during build

## Health Check
The application provides a health check endpoint at `/health` that Railway uses to monitor the service.

## Troubleshooting

### Build Errors
If you encounter build errors like "unknown type 'Database'":

1. **Check Ballerina Version**: Ensure Railway is using Ballerina 2201.12.7
2. **Clear Cache**: Railway might need to clear build cache
3. **Check Dependencies**: All required dependencies are in `Ballerina.toml`
4. **Build Script**: The `build.sh` script provides better error reporting

### MongoDB Connection Issues
1. **Connection String**: Already configured in `railway.toml`
2. **Network Access**: Ensure MongoDB Atlas allows connections from Railway IPs
3. **Database Name**: Using `healthDB` as configured

### Common Solutions
1. **Redeploy**: Sometimes a fresh deployment fixes build issues
2. **Check Logs**: Railway provides detailed build and runtime logs
3. **Environment Variables**: Verify all environment variables are set correctly

## API Endpoints
Once deployed, your API will be available at:
- Health Check: `https://your-app.railway.app/health`
- All other endpoints: `https://your-app.railway.app/health/*`

## Database Collections
The application will automatically create these collections:
- `users` - User profiles and authentication
- `diseases` - Disease records
- `appointments` - General appointments
- `bmi_records` - BMI tracking data
- `vaccine_records` - Vaccine information
- `doc_appointments` - Doctor appointments

## CORS Configuration
The application is configured to allow requests from:
- `http://localhost:5173` (local development)
- `http://127.0.0.1:5173` (local development)
- `https://babapotha.vercel.app` (production frontend)
