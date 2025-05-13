#!/bin/bash

# Set environment file
export ENV_FILE=.env.production

# Install dependencies if needed
if [ "$1" == "install" ]; then
    echo "Installing frontend dependencies..."
    npm install
fi

# Run the application
if [ "$1" == "run" ]; then
    echo "Starting frontend production server with .env.production..."
    npm run dev:prod
fi

# Build the application
if [ "$1" == "build" ]; then
    echo "Building frontend application with .env.production..."
    npm run build:prod
fi

# Default action
if [ -z "$1" ]; then
    echo "Usage: ./scripts/prod.sh [install|run|build]"
    echo "  install - Install dependencies"
    echo "  run     - Run production server"
    echo "  build   - Build the application"
fi