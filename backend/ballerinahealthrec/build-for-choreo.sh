#!/bin/bash

echo "🔨 Building Ballerina application for Choreo deployment..."

# Build the Ballerina application
bal build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"
echo ""
echo "📦 Generated files:"
echo "  - JAR file: target/bin/healthRecords.jar"
echo "  - BALA package: target/bala/himasha_valantina-healthRecords-java21-0.1.0.bala"
echo ""
echo "🚀 Next steps for Choreo deployment:"
echo "1. Go to Choreo Console: https://console.choreo.dev/"
echo "2. Navigate to your component: ballerinahealthrec"
echo "3. Go to 'Deploy' tab"
echo "4. Upload the JAR file: target/bin/healthRecords.jar"
echo "5. Go to 'Config' tab and set environment variables:"
echo "   - DATABASE_HOST=mysql-production-8217.up.railway.app"
echo "   - DATABASE_PORT=3306"
echo "   - DATABASE_NAME=railway"
echo "   - DATABASE_USER=root"
echo "   - DATABASE_PASSWORD=ElBlPtqKfjEFfDBjcYzwfuqcTVTzEHCl"
echo "6. Save and redeploy"
echo ""
echo "🧪 Test after deployment:"
echo "curl -X GET 'https://316dda40-9b55-45ef-bc8e-8204b688dbea-dev.e1-us-east-azure.choreoapis.dev/default/ballerinahealthrec/v1.0/health'"
