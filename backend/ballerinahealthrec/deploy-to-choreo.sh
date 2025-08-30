#!/bin/bash

echo "🚀 Building Ballerina application for Choreo deployment..."

# Build the application
bal build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "📋 Next steps for Choreo deployment:"
    echo "1. Go to https://console.choreo.dev/"
    echo "2. Navigate to your 'ballerinahealthrec' component"
    echo "3. Go to 'Deploy' tab"
    echo "4. Upload the generated JAR file: target/bin/healthRecords.jar"
    echo "5. Deploy the component"
    echo ""
    echo "🔧 The backend is now hardcoded to use Railway MySQL database:"
    echo "   Host: mysql-production-8217.up.railway.app"
    echo "   Database: railway"
    echo "   User: root"
    echo ""
    echo "📁 Generated JAR file: target/bin/healthRecords.jar"
else
    echo "❌ Build failed!"
    exit 1
fi
