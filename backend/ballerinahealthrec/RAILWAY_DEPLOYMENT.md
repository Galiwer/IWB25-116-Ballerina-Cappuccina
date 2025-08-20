# Railway Deployment Guide

## Prerequisites
1. Railway account (https://railway.app)
2. MongoDB database (you can use Railway's MongoDB plugin or external MongoDB Atlas)

## Deployment Steps

### 1. Connect Your Repository
1. Go to Railway dashboard
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Choose your repository
5. Set the root directory to `backend/ballerinahealthrec`

### 2. Set Environment Variables
In your Railway project settings, add these environment variables:

```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/babadb?retryWrites=true&w=majority
PORT=9090
BALLERINA_DISTRIBUTION=2201.12.7
```

### 3. Add MongoDB Database
1. In Railway dashboard, go to your project
2. Click "New" → "Database" → "MongoDB"
3. Railway will automatically add the `MONGODB_URI` environment variable
4. Copy the connection string and update your environment variables

### 4. Deploy
1. Railway will automatically detect the Ballerina project
2. It will use the `nixpacks.toml` configuration to build and deploy
3. The service will be available at the provided Railway URL

### 5. Update Frontend Configuration
Update your frontend's API base URL to point to your Railway deployment:
```javascript
const API_BASE_URL = 'https://your-railway-app.railway.app';
```

## Configuration Files

### railway.toml
- Configures the build and deployment process
- Sets health check endpoint to `/health`
- Configures restart policy

### nixpacks.toml
- Specifies Ballerina and OpenJDK as dependencies
- Defines build and start commands

### Ballerina.toml
- Project configuration and dependencies
- MongoDB connector version

## Health Check
The application provides a health check endpoint at `/health` that Railway uses to monitor the service.

## Troubleshooting
1. Check Railway logs for build errors
2. Verify environment variables are set correctly
3. Ensure MongoDB connection string is valid
4. Check if the port is correctly configured

## API Endpoints
Once deployed, your API will be available at:
- Health Check: `https://your-app.railway.app/health`
- All other endpoints: `https://your-app.railway.app/health/*`
