# Vercel Deployment Guide for Logistic UI

This guide will help you deploy your Logistic UI React application to Vercel.

## Prerequisites

- A GitHub account
- A Vercel account (free at [vercel.com](https://vercel.com))
- Your code pushed to a GitHub repository

## Method 1: Deploy via Vercel Dashboard (Recommended)

### Step 1: Push to GitHub

1. Initialize Git in your project (if not already done):
   ```bash
   cd logistic-ui
   git init
   git add .
   git commit -m "Initial commit: Logistic UI React app"
   ```

2. Create a new repository on GitHub:
   - Go to [github.com](https://github.com)
   - Click "New repository"
   - Name it `logistic-ui` or similar
   - Don't initialize with README (we already have one)

3. Push your code:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/logistic-ui.git
   git branch -M main
   git push -u origin main
   ```

### Step 2: Deploy on Vercel

1. Go to [vercel.com](https://vercel.com) and sign in
2. Click "New Project"
3. Import your GitHub repository
4. Vercel will auto-detect it's a Vite project
5. Configure the project:
   - **Framework Preset**: Vite
   - **Root Directory**: `./` (leave empty)
   - **Build Command**: `npm run build` (auto-detected)
   - **Output Directory**: `dist` (auto-detected)
   - **Install Command**: `npm install` (auto-detected)

6. Click "Deploy"

### Step 3: Verify Deployment

- Vercel will build and deploy your app
- You'll get a URL like: `https://your-project-name.vercel.app`
- The app should be live in 1-2 minutes

## Method 2: Deploy via Vercel CLI

### Step 1: Install Vercel CLI

```bash
npm install -g vercel
```

### Step 2: Deploy

```bash
cd logistic-ui
vercel
```

Follow the prompts:
- Link to existing project or create new
- Confirm project settings
- Deploy

## Configuration Files

### vercel.json
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "installCommand": "npm install",
  "framework": "vite",
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ]
}
```

### .vercelignore
Excludes unnecessary files from deployment:
- `node_modules/`
- Development files
- Environment files
- IDE files
- `start.sh` (development script)

## Environment Variables

If you need environment variables:

1. Go to your Vercel project dashboard
2. Navigate to Settings → Environment Variables
3. Add your variables:
   - `VITE_API_URL` (if you have an API)
   - `VITE_APP_TITLE` (for app title)

## Custom Domain (Optional)

1. Go to your Vercel project dashboard
2. Navigate to Settings → Domains
3. Add your custom domain
4. Configure DNS as instructed

## Automatic Deployments

- Every push to `main` branch triggers automatic deployment
- Preview deployments for pull requests
- Automatic rollback on failed deployments

## Troubleshooting

### Build Errors
- Check the build logs in Vercel dashboard
- Ensure all dependencies are in `package.json`
- Verify Node.js version compatibility

### 404 Errors
- The `vercel.json` includes SPA routing configuration
- All routes should redirect to `index.html`

### Performance Issues
- Vercel automatically optimizes static assets
- Images are automatically optimized
- CDN is automatically configured

## Monitoring

- View deployment status in Vercel dashboard
- Check analytics and performance metrics
- Monitor error logs and performance

## Support

- Vercel Documentation: [vercel.com/docs](https://vercel.com/docs)
- Vercel Community: [github.com/vercel/vercel/discussions](https://github.com/vercel/vercel/discussions)

## Next Steps

After successful deployment:

1. **Test the live site** - Ensure all features work
2. **Set up monitoring** - Enable analytics if needed
3. **Configure custom domain** - If you have one
4. **Set up environment variables** - For any API endpoints
5. **Enable automatic deployments** - For continuous deployment

Your Logistic UI will be live and accessible worldwide! 🚀 