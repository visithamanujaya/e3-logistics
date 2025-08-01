const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get('/', (req, res) => {
  res.json({
    message: 'Hello World from Logistic API!',
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development',
    version: '1.0.0'
  });
});

app.get('/health', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development'
  });
});

app.get('/api/hello', (req, res) => {
  res.json({
    message: 'Hello from the API!',
    timestamp: new Date().toISOString()
  });
});

app.get('/api/logistics', (req, res) => {
  res.json({
    message: 'Logistics API is working!',
    data: [
      {
        id: 1,
        name: 'Sample Shipment',
        status: 'pending',
        created_at: new Date().toISOString()
      },
      {
        id: 2,
        name: 'Test Delivery',
        status: 'in_transit',
        created_at: new Date().toISOString()
      }
    ],
    count: 2
  });
});

app.post('/api/logistics', (req, res) => {
  const { name, description } = req.body;
  
  if (!name) {
    return res.status(400).json({
      error: 'Name is required'
    });
  }

  const newItem = {
    id: Date.now(),
    name,
    description: description || '',
    status: 'pending',
    created_at: new Date().toISOString()
  };

  res.status(201).json({
    message: 'Logistics item created successfully',
    data: newItem
  });
});

// 404 handler
app.use('*', (req, res) => {
  res.status(404).json({
    error: 'Route not found',
    path: req.originalUrl,
    method: req.method
  });
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    error: 'Something went wrong!',
    message: process.env.NODE_ENV === 'development' ? err.message : 'Internal server error'
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
  console.log(`📱 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`🌐 Health check: http://localhost:${PORT}/health`);
  console.log(`📋 API docs: http://localhost:${PORT}/`);
});

module.exports = app; 