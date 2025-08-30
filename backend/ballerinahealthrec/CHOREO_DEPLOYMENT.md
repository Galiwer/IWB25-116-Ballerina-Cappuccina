# Choreo Deployment Guide

This guide explains how to deploy the Health Records API to Choreo.

## Prerequisites

1. **Choreo Account**: You need a Choreo account at https://console.choreo.dev/
2. **Ballerina Project**: The project should be built successfully with `bal build`
3. **Database**: Railway MySQL database should be set up and accessible

## Deployment Steps

### Step 1: Build the Application

```bash
cd backend/ballerinahealthrec
bal build
```

This will create the executable JAR file in `target/bin/healthRecords.jar`.

### Step 2: Deploy to Choreo Console

1. **Go to Choreo Console**: https://console.choreo.dev/
2. **Navigate to your component**: Find your `ballerinahealthrec` component
3. **Go to 'Deploy' tab**: Click on the Deploy tab in your component
4. **Upload the JAR file**: 
   - Click "Upload" or "Deploy"
   - Select the file: `target/bin/healthRecords.jar`
   - Wait for the deployment to complete

### Step 3: Configure Environment Variables

1. **Go to 'Config' tab**: In your Choreo component
2. **Add Environment Variables**:
   ```
   DATABASE_HOST=mysql-production-8217.up.railway.app
   DATABASE_PORT=3306
   DATABASE_NAME=railway
   DATABASE_USER=root
   DATABASE_PASSWORD=ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl
   ```
3. **Save Configuration**: Click "Save" button
4. **Redeploy**: After saving, redeploy the component

### Step 4: Test the Deployment

Test the health endpoint:
```bash
curl -X GET 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health'
```

Expected response:
```json
{"message": "Health Records API is running"}
```

### Step 5: Update Frontend Configuration

Update your frontend environment variables in Vercel:

1. **Go to Vercel Dashboard**: https://vercel.com/dashboard
2. **Select your project**: `babapotha`
3. **Go to Settings > Environment Variables**
4. **Add/Update these variables**:
   ```
   VITE_API_BASE_URL=https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0
   VITE_CHOREO_API_KEY=your_choreo_api_key_here
   ```
5. **Redeploy the frontend**: Trigger a new deployment

## Troubleshooting

### "Database not initialized" Error

If you get this error, it means the environment variables are not set correctly:

1. **Check Environment Variables**: Go to Choreo Console > Config tab
2. **Verify all variables are set**: DATABASE_HOST, DATABASE_PORT, DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD
3. **Redeploy**: After setting variables, redeploy the component

### Connection Issues

If the backend can't connect to the database:

1. **Check Railway Database**: Ensure your Railway MySQL instance is running
2. **Verify Credentials**: Double-check the database credentials
3. **Check Network**: Ensure Choreo can reach Railway (should work by default)

### CORS Issues

If the frontend can't connect to the backend:

1. **Check CORS Configuration**: The backend is configured to allow `https://babapotha.vercel.app`
2. **Verify API Key**: Ensure the Choreo API key is set correctly in frontend
3. **Check URLs**: Verify the API base URL is correct

## API Endpoints

Once deployed, your API will be available at:
```
https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0
```

Available endpoints:
- `GET /health` - Health check
- `POST /signup` - User registration
- `POST /login` - User authentication
- `GET /bmi` - Get BMI records
- `POST /bmi` - Add BMI record
- `PUT /bmi/{id}` - Update BMI record
- `DELETE /bmi/{id}` - Delete BMI record
- And many more...

## Security Notes

1. **API Keys**: Use Choreo API keys for authentication
2. **Database**: Railway provides SSL connections by default
3. **CORS**: Configured to allow only your Vercel frontend domain
4. **Environment Variables**: Never commit sensitive data to version control

## Support

If you encounter issues:
1. Check the Choreo console logs
2. Verify all environment variables are set
3. Test the database connection manually
4. Check the Railway database status
