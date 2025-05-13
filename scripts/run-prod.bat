@echo off
set ENV_FILE=.env.production
echo Starting production environment with %ENV_FILE%...
docker-compose up