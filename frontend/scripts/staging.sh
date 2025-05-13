#!/bin/bash

# Set environment file
export ENV_FILE=.env.staging

# Change to the parent directory (frontend root)
cd ..

# Install dependencies if needed
if [ "$1" == "install" ]; then
    echo "Installing frontend dependencies..."
    npm install
fi

# Run the application
if [ "$1" == "run" ]; then
    echo "Starting frontend staging server with .env.staging..."
    npm run dev:staging
fi

# Build the application
if [ "$1" == "build" ]; then
    echo "Building frontend application with .env.staging..."
    npm run build:staging
fi

# Default action
if [ -z "$1" ]; then
    echo "Usage: ./scripts/staging.sh [install|run|build]"
    echo "  install - Install dependencies"
    echo "  run     - Run staging server"
    echo "  build   - Build the application"
fi