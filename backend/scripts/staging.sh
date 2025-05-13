#!/bin/bash

# Set environment file
export ENV_FILE=.env.staging

# Install dependencies if needed
if [ "$1" == "install" ]; then
    echo "Installing backend dependencies..."
    pip install -r ../requirements.txt
fi

# Run the application
if [ "$1" == "run" ]; then
    echo "Starting backend staging server with .env.staging..."
    uvicorn app.main:app --host 0.0.0.0 --port 8000
fi

# Build the application
if [ "$1" == "build" ]; then
    echo "Building backend application with .env.staging..."
    # Add build steps here if needed
    echo "Build completed"
fi

# Default action
if [ -z "$1" ]; then
    echo "Usage: ./scripts/staging.sh [install|run|build]"
    echo "  install - Install dependencies"
    echo "  run     - Run staging server"
    echo "  build   - Build the application"
fi