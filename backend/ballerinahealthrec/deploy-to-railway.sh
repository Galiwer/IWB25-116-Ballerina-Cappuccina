#!/bin/bash

# Railway Deployment Script for Health Records API
echo "🚂 Deploying Health Records API to Railway..."

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Installing..."
    npm install -g @railway/cli
fi

# Check if user is logged in
if ! railway whoami &> /dev/null; then
    echo "🔐 Please login to Railway..."
    railway login
fi

# Check if project is linked
if ! railway status &> /dev/null; then
    echo "🔗 Linking to Railway project..."
    railway link
fi

# Build the application locally first
echo "🔨 Building application..."
bal build

if [ $? -eq 0 ]; then
    echo "✅ Build successful"
else
    echo "❌ Build failed"
    exit 1
fi

# Deploy to Railway
echo "🚀 Deploying to Railway..."
railway up

if [ $? -eq 0 ]; then
    echo "✅ Deployment successful!"
    echo "🌐 Your application is now live on Railway"
    echo "📊 Check Railway dashboard for logs and monitoring"
else
    echo "❌ Deployment failed"
    exit 1
fi

echo "🎉 Railway deployment complete!"
