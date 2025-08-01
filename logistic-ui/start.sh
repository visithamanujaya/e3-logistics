#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Logistic UI React Application...${NC}"
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
    echo -e "${RED}❌ package.json not found. Please run this script from the logistic-ui directory.${NC}"
    exit 1
fi

# Check if node_modules exists, if not install dependencies
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    echo -e "${PURPLE}⏳ This may take a few minutes...${NC}"
    npm install
    if [ $? -ne 0 ]; then
        echo -e "${RED}❌ Failed to install dependencies${NC}"
        echo -e "${YELLOW}💡 Try running 'npm install' manually${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Dependencies installed successfully${NC}"
else
    echo -e "${GREEN}✅ Dependencies already installed${NC}"
fi

# Check if port 3000 is available
if lsof -Pi :3000 -sTCP:LISTEN -t >/dev/null ; then
    echo -e "${YELLOW}⚠️  Port 3000 is already in use. Trying port 3001...${NC}"
    export PORT=3001
else
    export PORT=3000
fi

echo ""
echo -e "${BLUE}🌐 Starting development server...${NC}"
echo -e "${GREEN}📱 The app will be available at: http://localhost:$PORT${NC}"
echo -e "${YELLOW}💡 Press Ctrl+C to stop the server${NC}"
echo -e "${PURPLE}🔄 Hot reload is enabled - changes will auto-refresh${NC}"
echo ""

# Display app info
echo -e "${BLUE}📋 App Information:${NC}"
echo -e "${GREEN}   • Framework: React 18${NC}"
echo -e "${GREEN}   • Build Tool: Vite${NC}"
echo -e "${GREEN}   • Development: Hot reload enabled${NC}"
echo -e "${GREEN}   • Port: $PORT${NC}"
echo ""

# Start the development server
npm run dev 