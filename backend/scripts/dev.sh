#!/bin/bash

# Set environment file
export ENV_FILE=.env.dev

# Install dependencies if needed
if [ "$1" == "install" ]; then
    echo "Installing backend dependencies..."
    pip install -r ../requirements.txt
fi

# Run the application with hot reload
if [ "$1" == "run" ]; then
    echo "Starting backend development server with .env.dev..."
    uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
fi

# Build the application
if [ "$1" == "build" ]; then
    echo "Building backend application with .env.dev..."
    # Add build steps here if needed
    echo "Build completed"
fi

# Default action
if [ -z "$1" ]; then
    echo "Usage: ./scripts/dev.sh [install|run|build]"
    echo "  install - Install dependencies"
    echo "  run     - Run development server"
    echo "  build   - Build the application"
fi