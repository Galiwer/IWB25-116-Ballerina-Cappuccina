#!/bin/bash

echo "🚀 Deploying to Choreo..."

# Build the Ballerina application
echo "📦 Building Ballerina application..."
bal build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Deploy to Choreo
echo "🌐 Deploying to Choreo..."
bal choreo deploy

if [ $? -ne 0 ]; then
    echo "❌ Deployment failed!"
    exit 1
fi

echo "✅ Deployment successful!"
echo ""
echo "🔗 Your Choreo backend URL:"
echo "https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0"
echo ""
echo "📋 Next steps:"
echo "1. Go to Choreo Console: https://console.choreo.dev/"
echo "2. Navigate to your component: ballerinahealthrec"
echo "3. Go to 'Config' tab"
echo "4. Set these environment variables:"
echo "   - DATABASE_HOST: mysql-production-8217.up.railway.app"
echo "   - DATABASE_PORT: 3306"
echo "   - DATABASE_NAME: railway"
echo "   - DATABASE_USER: root"
echo "   - DATABASE_PASSWORD: ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
echo "5. Click 'Save' and redeploy"
echo ""
echo "🧪 Test the deployment:"
echo "curl -X GET 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health'"
