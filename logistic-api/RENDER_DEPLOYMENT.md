# Render Deployment Guide for Logistic API

This guide will help you deploy your Express.js Logistic API to Render.

## Prerequisites

- A [Render account](https://render.com) (free tier available)
- Your code pushed to a GitHub repository
- Node.js project with `package.json`

## Step 1: Push to GitHub

1. **Initialize Git (if not already done):**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Express Logistic API"
   ```

2. **Create a GitHub repository:**
   - Go to [github.com](https://github.com)
   - Click "New repository"
   - Name it `logistic-api` or similar
   - Don't initialize with README (we already have one)

3. **Push your code:**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/logistic-api.git
   git branch -M main
   git push -u origin main
   ```

## Step 2: Deploy on Render

1. **Go to Render Dashboard:**
   - Visit [render.com](https://render.com)
   - Sign in to your account
   - Click "New +"

2. **Create Web Service:**
   - Select "Web Service"
   - Connect your GitHub repository
   - Choose your `logistic-api` repository

3. **Configure the Service:**
   - **Name**: `logistic-api` (or your preferred name)
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Plan**: Free (or choose paid plan)

4. **Environment Variables (Optional):**
   - `NODE_ENV`: `production`
   - `PORT`: `10000` (Render will set this automatically)

5. **Click "Create Web Service"**

## Step 3: Verify Deployment

- Render will build and deploy your app
- You'll get a URL like: `https://your-app-name.onrender.com`
- The app should be live in 2-3 minutes

## API Endpoints

After deployment, your API will be available at:

- **Root**: `https://your-app-name.onrender.com/`
- **Health**: `https://your-app-name.onrender.com/health`
- **Hello**: `https://your-app-name.onrender.com/api/hello`
- **Logistics**: `https://your-app-name.onrender.com/api/logistics`

## Test Your Deployed API

```bash
# Health check
curl https://your-app-name.onrender.com/health

# Get logistics items
curl https://your-app-name.onrender.com/api/logistics

# Create logistics item
curl -X POST https://your-app-name.onrender.com/api/logistics \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Shipment", "description": "Test item"}'
```

## Local Development

### Start Locally
```bash
# Install dependencies
npm install

# Start development server
npm run dev
# or
./start.sh
```

### Test Locally
```bash
# Health check
curl http://localhost:3000/health

# Get logistics items
curl http://localhost:3000/api/logistics
```

## Project Structure

```
logistic-api/
├── server.js              # Main Express server
├── package.json           # Dependencies and scripts
├── start.sh              # Local development script
├── env.example           # Environment variables example
├── .gitignore           # Git ignore rules
└── RENDER_DEPLOYMENT.md  # This guide
```

## Features

- ✅ **Express.js server** with CORS and security headers
- ✅ **Health check endpoint** for monitoring
- ✅ **Logistics API endpoints** (GET and POST)
- ✅ **Error handling** and 404 responses
- ✅ **Environment variable support**
- ✅ **Ready for Render deployment**

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `3000` |
| `NODE_ENV` | Environment | `development` |

## Monitoring

- View logs in Render dashboard
- Monitor uptime and performance
- Set up alerts for downtime

## Troubleshooting

### Build Errors
- Check that `package.json` has correct `start` script
- Verify all dependencies are listed
- Check Node.js version compatibility

### Runtime Errors
- Check application logs in Render dashboard
- Verify environment variables are set correctly
- Test locally first

### CORS Issues
- API includes CORS headers for all origins
- Check frontend origin configuration

## Next Steps

After successful deployment:

1. **Test all endpoints** thoroughly
2. **Connect your frontend** to the API
3. **Set up monitoring** and alerts
4. **Configure custom domain** if needed
5. **Set up CI/CD** for automatic deployments

Your Logistic API is now live on Render! 🚀 