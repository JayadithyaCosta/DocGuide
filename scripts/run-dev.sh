#!/bin/bash
export ENV_FILE=.env.dev
echo "Starting development environment with $ENV_FILE..."
docker-compose up