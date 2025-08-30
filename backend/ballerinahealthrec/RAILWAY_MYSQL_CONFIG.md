# 🚂 Railway MySQL Configuration for Choreo

## Database Connection Details

Based on your Railway MySQL configuration, here are the environment variables to set in Choreo:

### Environment Variables for Choreo

```bash
# Primary connection string (recommended)
DATABASE_URL="mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@your-railway-private-domain:3306/railway"

# Individual connection parameters (alternative)
DATABASE_HOST="your-railway-private-domain"
DATABASE_PORT="3306"
DATABASE_NAME="railway"
DATABASE_USER="root"
DATABASE_PASSWORD="ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
```

### Railway-Specific Variables

```bash
# Railway connection details
RAILWAY_PRIVATE_DOMAIN="your-railway-private-domain"
RAILWAY_TCP_PROXY_DOMAIN="your-railway-tcp-proxy-domain"
RAILWAY_TCP_PROXY_PORT="your-railway-tcp-proxy-port"
MYSQL_DATABASE="railway"
MYSQL_ROOT_PASSWORD="ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
MYSQLUSER="root"
```

## Connection String Format

### For Private Network (Recommended)
```
mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@your-railway-private-domain:3306/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
```

### For Public Network (if needed)
```
mysql://root:ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl@your-railway-tcp-proxy-domain:your-railway-tcp-proxy-port/railway?useSSL=false&allowPublicKeyRetrieval=true&createDatabaseIfNotExist=true&autoReconnect=true&useUnicode=true&characterEncoding=utf8&cachePrepStmts=true&useServerPrepStmts=true&rewriteBatchedStatements=true&maintainTimeStats=false&elideSetAutoCommits=true&useLocalSessionState=true
```

## Steps to Configure

1. **Get Railway Connection Details**
   - Replace `your-railway-private-domain` with your actual Railway private domain
   - Replace `your-railway-tcp-proxy-domain` with your actual Railway TCP proxy domain
   - Replace `your-railway-tcp-proxy-port` with your actual Railway TCP proxy port

2. **Set Environment Variables in Choreo**
   - Go to your Choreo component settings
   - Add the environment variables listed above
   - Use the private network connection for better security

3. **Test the Connection**
   - Deploy your application
   - Check the logs for successful database connection
   - Test your API endpoints

## Security Notes

- ✅ Use private network connection when possible
- ✅ Keep database credentials secure
- ✅ Use environment variables, never hardcode credentials
- ✅ Railway provides SSL encryption for database connections

## Troubleshooting

### Connection Issues
- Verify Railway domain and port are correct
- Check if Railway database is running
- Ensure network connectivity between Choreo and Railway

### Authentication Issues
- Verify username is "root"
- Verify password is correct
- Check if database "railway" exists

### SSL Issues
- Railway MySQL supports SSL connections
- Use `useSSL=true` for production environments
