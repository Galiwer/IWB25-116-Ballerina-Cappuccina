# Railway Deployment Troubleshooting Guide

## Common Build Errors and Solutions

### 1. "undefined module 'http'" Errors

**Problem**: Railway build fails with "undefined module 'http'" errors.

**Solutions**:
1. **Clear Railway Build Cache**:
   - Go to Railway dashboard
   - Navigate to your project
   - Go to Settings → Build & Deploy
   - Click "Clear Build Cache"
   - Redeploy

2. **Check Ballerina Version**:
   - Ensure Railway is using Ballerina 2201.12.8
   - Update `railway.toml` if needed
   - Update `Ballerina.toml` distribution version

3. **Force Clean Build**:
   - Delete the `target/` directory locally
   - Commit and push changes
   - Railway will do a fresh build

### 2. MongoDB Connection Issues

**Problem**: "Error occurred while initializing the MongoDB client"

**Solutions**:
1. **Check Connection String**:
   - Verify `MONGODB_URI` is set correctly in Railway
   - Ensure MongoDB Atlas allows connections from Railway IPs
   - Test connection string locally

2. **Network Access**:
   - In MongoDB Atlas, go to Network Access
   - Add `0.0.0.0/0` to allow all IPs (for testing)
   - Or add Railway's IP range

### 3. Build Environment Issues

**Problem**: Build succeeds locally but fails on Railway

**Solutions**:
1. **Update Dependencies**:
   ```toml
   # In Ballerina.toml
   distribution = "2201.12.8"
   
   [[dependency]]
   org = "ballerinax"
   name = "mongodb"
   version = "5.1.0"
   ```

2. **Simplify Build Process**:
   - Use direct `bal build` instead of custom scripts
   - Remove unnecessary build steps

3. **Check Railway Logs**:
   - Look for specific error messages
   - Check if all dependencies are available

## Step-by-Step Fix Process

### Step 1: Clear Build Cache
1. Go to Railway dashboard
2. Select your project
3. Go to Settings → Build & Deploy
4. Click "Clear Build Cache"
5. Wait for cache to clear

### Step 2: Update Configuration
1. Ensure `railway.toml` has correct Ballerina version
2. Verify `Ballerina.toml` distribution matches
3. Check all environment variables are set

### Step 3: Force Fresh Build
1. Delete local `target/` directory
2. Commit and push changes
3. Railway will rebuild from scratch

### Step 4: Monitor Build Logs
1. Watch the build process in Railway
2. Look for specific error messages
3. Check if all dependencies resolve

## Environment Variables Checklist

Ensure these are set in Railway:
```
BALLERINA_DISTRIBUTION=2201.12.8
PORT=9090
MONGODB_URI=mongodb+srv://himashavalantina55:Hima%401234@cluster0.ktheqad.mongodb.net/healthDB?retryWrites=true&w=majority
```

## File Structure Verification

Ensure your project structure is:
```
backend/ballerinahealthrec/
├── Ballerina.toml
├── main.bal
├── type.bal
├── railway.toml
├── nixpacks.toml
├── build.sh
└── .gitignore
```

## Alternative Deployment Options

If Railway continues to have issues:

1. **Use Railway's MongoDB Plugin**:
   - Remove external MongoDB connection
   - Use Railway's built-in MongoDB
   - Update connection string accordingly

2. **Simplify the Application**:
   - Start with a minimal version
   - Add features incrementally
   - Test each addition

3. **Use Different Platform**:
   - Consider Heroku, DigitalOcean, or AWS
   - Each has different Ballerina support

## Contact Support

If issues persist:
1. Check Railway's Ballerina support documentation
2. Contact Railway support with build logs
3. Consider using a different deployment platform

## Success Indicators

Your deployment is successful when:
- ✅ Build completes without errors
- ✅ Health check endpoint responds: `https://your-app.railway.app/health`
- ✅ MongoDB connection is established
- ✅ All API endpoints are accessible
