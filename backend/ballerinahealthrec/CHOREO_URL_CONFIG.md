# 🔗 Choreo URL Configuration

## 🎯 Your Choreo Backend URL

Your Choreo backend is deployed at:
```
https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0
```

## 🔧 URL Structure Analysis

### Base URL
```
https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev
```

### API Path
```
/default/ballerinahealthrec/v1.0
```

### Complete API URL
```
https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0
```

## 🌐 Frontend Configuration

### Environment Variable for Vercel

Set this environment variable in your Vercel project:

```bash
Name: VITE_API_BASE_URL
Value: https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0
Environment: Production, Preview, Development
```

### API Endpoints

Your frontend will automatically append `/health` to the base URL, so the endpoints will be:

- **Health Check**: `https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health`
- **Login**: `https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health/login`
- **User Profile**: `https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health/getUserProfile`
- **BMI Records**: `https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health/getBmiRecords`

## 🔐 Authentication

Choreo APIs typically require authentication. You may need to:

1. **Configure API Keys** in Choreo console
2. **Add Authorization Headers** to your requests
3. **Set up CORS** properly for your Vercel domain

## 🧪 Testing

### Test with curl (requires authentication)
```bash
# Test health endpoint
curl -X GET "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Test from browser console
fetch('https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health')
  .then(response => response.json())
  .then(data => console.log('API Response:', data))
  .catch(error => console.error('API Error:', error))
```

## 📋 Next Steps

1. **Set Vercel Environment Variable** with the base URL
2. **Configure Authentication** in Choreo console
3. **Test API Endpoints** with proper authentication
4. **Redeploy Frontend** to use the new API URL
5. **Verify All Features** work with Choreo backend

## 🔍 Troubleshooting

### Authentication Issues
- Check Choreo console for API key configuration
- Verify CORS settings allow your Vercel domain
- Ensure proper Authorization headers are sent

### CORS Issues
- Configure CORS in Choreo to allow Vercel domains
- Check browser console for CORS errors
- Verify API URL is correct

### Network Issues
- Test API endpoints directly
- Check Choreo service status
- Verify environment variables are set correctly
