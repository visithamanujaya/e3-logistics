#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Logistic API - Express Server...${NC}"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed. Please install Node.js first.${NC}"
    echo -e "${YELLOW}📥 Download from: https://nodejs.org/${NC}"
    echo -e "${YELLOW}💡 Recommended version: 18.x or higher${NC}"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm is not installed. Please install npm first.${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Node.js version: $(node --version)${NC}"
echo -e "${GREEN}✅ npm version: $(npm --version)${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo -e "${RED}❌ package.json not found. Please run this script from the logistic-api directory.${NC}"
    exit 1
fi

# Check if node_modules exists, if not install dependencies
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Failed to install dependencies${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Dependencies installed successfully${NC}"
else
    echo -e "${GREEN}✅ Dependencies already installed${NC}"
fi

# Check if .env file exists, if not create from example
if [ ! -f ".env" ]; then
    if [ -f "env.example" ]; then
        echo -e "${YELLOW}📝 Creating .env file from example...${NC}"
        cp env.example .env
        echo -e "${GREEN}✅ .env file created${NC}"
    else
        echo -e "${YELLOW}⚠️  No .env file found. Creating basic one...${NC}"
        echo "PORT=3000" > .env
        echo "NODE_ENV=development" >> .env
        echo -e "${GREEN}✅ Basic .env file created${NC}"
    fi
fi

# Check if port 3000 is available
if lsof -Pi :3000 -sTCP:LISTEN -t >/dev/null ; then
    echo -e "${YELLOW}⚠️  Port 3000 is already in use. Trying port 3001...${NC}"
    export PORT=3001
else
    export PORT=3000
fi

echo ""
echo -e "${BLUE}🌐 Starting Express server on port $PORT...${NC}"
echo -e "${GREEN}📱 The API will be available at: http://localhost:$PORT${NC}"
echo -e "${YELLOW}💡 Press Ctrl+C to stop the server${NC}"
echo ""

# Display API endpoints
echo -e "${BLUE}📋 Available API Endpoints:${NC}"
echo -e "${GREEN}   • GET  / - API info and docs${NC}"
echo -e "${GREEN}   • GET  /health - Health check${NC}"
echo -e "${GREEN}   • GET  /api/hello - Hello endpoint${NC}"
echo -e "${GREEN}   • GET  /api/logistics - Get logistics items${NC}"
echo -e "${GREEN}   • POST /api/logistics - Create logistics item${NC}"

echo ""
echo -e "${PURPLE}🧪 Test your API:${NC}"
echo -e "${CYAN}   curl http://localhost:$PORT/health${NC}"
echo -e "${CYAN}   curl http://localhost:$PORT/api/logistics${NC}"

echo ""
echo -e "${BLUE}🔄 Starting server...${NC}"

# Start the server
npm start 