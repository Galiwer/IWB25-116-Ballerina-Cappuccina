#!/bin/bash

# Deploy Health Records API to Choreo
# This script helps automate the deployment process

echo "🚀 Deploying Health Records API to Choreo..."

# Check if Choreo CLI is installed
if ! command -v choreo &> /dev/null; then
    echo "❌ Choreo CLI not found. Installing..."
    npm install -g @choreo/cli
fi

# Check if user is logged in to Choreo
if ! choreo whoami &> /dev/null; then
    echo "🔐 Please login to Choreo first:"
    choreo login
fi

# Build the application
echo "🔨 Building Ballerina application..."
bal build

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
else
    echo "❌ Build failed!"
    exit 1
fi

# Deploy to Choreo
echo "📦 Deploying to Choreo..."
choreo deploy

if [ $? -eq 0 ]; then
    echo "✅ Deployment successful!"
    echo "🌐 Your application is now live on Choreo!"
    echo "📋 Don't forget to:"
    echo "   1. Configure environment variables in Choreo console"
    echo "   2. Set up your database connection"
    echo "   3. Update your frontend to use the new Choreo URL"
else
    echo "❌ Deployment failed!"
    exit 1
fi
