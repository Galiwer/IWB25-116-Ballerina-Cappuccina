# Deploying Health Records API to Choreo

This guide will help you deploy the Health Records API to Choreo cloud platform.

## Prerequisites

1. **Choreo Account**: You need a Choreo account with appropriate permissions
2. **Git Repository**: Your code should be in a Git repository (GitHub, GitLab, etc.)
3. **Database**: A MySQL database accessible from Choreo (you can use Choreo's managed database or external database)

## Step 1: Prepare Your Repository

Ensure your repository structure looks like this:
```
backend/ballerinahealthrec/
├── Ballerina.toml
├── Choreo.toml
├── main.bal
├── lib/
│   └── mysql-connector-j-8.3.0.jar
└── CHOREO_DEPLOYMENT.md
```

## Step 2: Configure Database

### Option A: Use Choreo Managed Database
1. In Choreo console, create a new MySQL database
2. Note down the connection details (host, port, username, password)
3. Update the environment variables in Choreo.toml

### Option B: Use External Database
1. Ensure your external MySQL database is accessible from Choreo
2. Update the DATABASE_URL in Choreo.toml with your database details

## Step 3: Deploy to Choreo

### Method 1: Using Choreo Console (Recommended)

1. **Login to Choreo Console**
   - Go to https://console.choreo.dev
   - Sign in with your account

2. **Create New Project**
   - Click "Create Project"
   - Give it a name (e.g., "Health Records")
   - Choose your organization

3. **Create New Component**
   - Click "Create Component"
   - Select "Service" as component type
   - Choose "Ballerina" as the language
   - Connect your Git repository

4. **Configure Build**
   - Set the source directory to `backend/ballerinahealthrec`
   - Build command: `bal build`
   - Output path: `target/bin/healthRecords.jar`

5. **Configure Environment Variables**
   - Add the following environment variables:
     - `DATABASE_URL`: Your MySQL connection string
     - `DATABASE_USER`: Database username
     - `DATABASE_PASSWORD`: Database password

6. **Deploy**
   - Click "Deploy" to start the deployment process
   - Monitor the build and deployment logs

### Method 2: Using Choreo CLI

1. **Install Choreo CLI**
   ```bash
   npm install -g @choreo/cli
   ```

2. **Login to Choreo**
   ```bash
   choreo login
   ```

3. **Deploy the application**
   ```bash
   cd backend/ballerinahealthrec
   choreo deploy
   ```

## Step 4: Configure Environment Variables

In Choreo console, set these environment variables:

```bash
DATABASE_URL=jdbc:mysql://your-mysql-host:3306/babadb?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
DATABASE_USER=your-username
DATABASE_PASSWORD=your-password
```

## Step 5: Test Your Deployment

Once deployed, test your API endpoints:

1. **Health Check**
   ```bash
   curl https://your-choreo-url/health
   ```

2. **User Profile**
   ```bash
   curl https://your-choreo-url/health/getUserProfile?userId=your-user-id
   ```

3. **BMI Records**
   ```bash
   curl https://your-choreo-url/health/getBmiRecords?userId=your-user-id
   ```

## Step 6: Update Frontend Configuration

Update your frontend application to use the new Choreo URL:

```typescript
// In your frontend configuration
const BASE_URL = 'https://your-choreo-url/health';
```

## Troubleshooting

### Common Issues

1. **Build Failures**
   - Check that all dependencies are properly configured in Ballerina.toml
   - Ensure the MySQL connector JAR file is present in the lib/ directory

2. **Database Connection Issues**
   - Verify database credentials and connection string
   - Ensure database is accessible from Choreo's network
   - Check firewall settings

3. **Runtime Errors**
   - Check Choreo logs for detailed error messages
   - Verify environment variables are set correctly
   - Ensure all required files are included in the deployment

### Monitoring

1. **View Logs**: Use Choreo console to view application logs
2. **Metrics**: Monitor CPU, memory, and request metrics
3. **Health Checks**: Set up health check endpoints for monitoring

## Security Considerations

1. **Environment Variables**: Never commit sensitive data like database passwords
2. **CORS**: Configure CORS settings for your frontend domain
3. **Authentication**: Implement proper authentication mechanisms
4. **HTTPS**: Choreo provides HTTPS by default

## Scaling

1. **Auto-scaling**: Configure auto-scaling rules in Choreo
2. **Resource Limits**: Adjust CPU and memory limits as needed
3. **Database Scaling**: Consider database scaling for high traffic

## Support

For Choreo-specific issues:
- Choreo Documentation: https://docs.choreo.dev
- Choreo Community: https://community.choreo.dev
- Support: https://support.choreo.dev
