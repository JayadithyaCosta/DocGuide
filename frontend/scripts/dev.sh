#!/bin/bash

# Set environment file
export ENV_FILE=.env.dev

# Install dependencies if needed
if [ "$1" == "install" ]; then
    echo "Installing frontend dependencies..."
    npm install
fi

# Run the application
if [ "$1" == "run" ]; then
    echo "Starting frontend development server with .env.dev..."
    npm run dev
fi

# Build the application
if [ "$1" == "build" ]; then
    echo "Building frontend application with .env.dev..."
    npm run build
fi

# Default action
if [ -z "$1" ]; then
    echo "Usage: ./scripts/dev.sh [install|run|build]"
    echo "  install - Install dependencies"
    echo "  run     - Run development server"
    echo "  build   - Build the application"
fi