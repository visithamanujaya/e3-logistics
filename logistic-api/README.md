# Logistic API - Express.js

A simple Hello World API built with Express.js for logistics management, ready to deploy on Render.

## Features

- 🚀 **Express.js server** with modern middleware
- 🛡️ **Security headers** with Helmet
- 🌐 **CORS enabled** for cross-origin requests
- 📊 **Health check endpoint** for monitoring
- 📦 **Logistics API endpoints** with sample data
- ⚡ **Fast and lightweight** for production deployment

## API Endpoints

### Health & Info
- `GET /` - API information and documentation
- `GET /health` - Health check with uptime

### Logistics
- `GET /api/logistics` - Get all logistics items
- `POST /api/logistics` - Create new logistics item

### Hello World
- `GET /api/hello` - Simple hello endpoint

## Quick Start

### Local Development

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Start the server:**
   ```bash
   # Using npm
   npm start
   
   # Using the start script
   ./start.sh
   
   # Development mode with nodemon
   npm run dev
   ```

3. **Test the API:**
   ```bash
   # Health check
   curl http://localhost:3000/health
   
   # Get logistics items
   curl http://localhost:3000/api/logistics
   
   # Create logistics item
   curl -X POST http://localhost:3000/api/logistics \
     -H "Content-Type: application/json" \
     -d '{"name": "Test Shipment", "description": "Test item"}'
   ```

## Deployment

### Render (Recommended)

1. **Push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/logistic-api.git
   git push -u origin main
   ```

2. **Deploy on Render:**
   - Go to [render.com](https://render.com)
   - Create new Web Service
   - Connect your GitHub repository
   - Build Command: `npm install`
   - Start Command: `npm start`

3. **Your API will be live at:**
   - `https://your-app-name.onrender.com`

## Project Structure

```
logistic-api/
├── server.js              # Main Express server
├── package.json           # Dependencies and scripts
├── start.sh              # Local development script
├── env.example           # Environment variables example
├── .gitignore           # Git ignore rules
├── README.md            # This file
└── RENDER_DEPLOYMENT.md # Deployment guide
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Server port | `3000` |
| `NODE_ENV` | Environment | `development` |

## Dependencies

- **express** - Web framework
- **cors** - Cross-origin resource sharing
- **helmet** - Security headers
- **dotenv** - Environment variables

## Development Dependencies

- **nodemon** - Auto-restart on file changes

## API Response Examples

### Health Check
```json
{
  "status": "healthy",
  "timestamp": "2024-08-01T22:00:00.000Z",
  "uptime": 123.456,
  "environment": "development"
}
```

### Get Logistics Items
```json
{
  "message": "Logistics API is working!",
  "data": [
    {
      "id": 1,
      "name": "Sample Shipment",
      "status": "pending",
      "created_at": "2024-08-01T22:00:00.000Z"
    }
  ],
  "count": 1
}
```

### Create Logistics Item
```json
{
  "message": "Logistics item created successfully",
  "data": {
    "id": 1735689600000,
    "name": "Test Shipment",
    "description": "Test item",
    "status": "pending",
    "created_at": "2024-08-01T22:00:00.000Z"
  }
}
```

## Error Handling

- **400 Bad Request** - Invalid input data
- **404 Not Found** - Route not found
- **500 Internal Server Error** - Server errors

## Security Features

- **Helmet.js** - Security headers
- **CORS** - Cross-origin requests
- **Input validation** - Request validation
- **Error sanitization** - Hide sensitive info in production

## Monitoring

- Health check endpoint for uptime monitoring
- Structured logging for debugging
- Environment-aware error messages

## Next Steps

After deployment:

1. **Test all endpoints** thoroughly
2. **Connect your frontend** to the API
3. **Add database integration** (PostgreSQL, MongoDB)
4. **Implement authentication** (JWT, OAuth)
5. **Add more logistics features** (tracking, notifications)

## License

MIT License 