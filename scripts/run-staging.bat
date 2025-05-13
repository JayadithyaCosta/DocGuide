@echo off
set ENV_FILE=.env.staging
echo Starting staging environment with %ENV_FILE%...
docker-compose up