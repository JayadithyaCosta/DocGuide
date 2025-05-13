@echo off

REM Set environment file
set ENV_FILE=.env.staging

IF "%1"=="install" (
    echo Installing frontend dependencies...
    npm install
    goto :eof
)

IF "%1"=="run" (
    echo Starting frontend staging server with .env.staging...
    npm run dev:staging
    goto :eof
)

IF "%1"=="build" (
    echo Building frontend application with .env.staging...
    npm run build:staging
    goto :eof
)

IF "%1"=="" (
    echo Usage: scripts\staging.bat [install^|run^|build]
    echo   install - Install dependencies
    echo   run     - Run staging server
    echo   build   - Build the application
)