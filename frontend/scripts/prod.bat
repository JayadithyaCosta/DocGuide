@echo off

REM Set environment file
set ENV_FILE=.env.production

REM Change to the parent directory (frontend root)
cd ..

IF "%1"=="install" (
    echo Installing frontend dependencies...
    npm install
    goto :eof
)

IF "%1"=="run" (
    echo Starting frontend production server with .env.production...
    npm run dev:prod
    goto :eof
)

IF "%1"=="build" (
    echo Building frontend application with .env.production...
    npm run build:prod
    goto :eof
)

IF "%1"=="" (
    echo Usage: scripts\prod.bat [install^|run^|build]
    echo   install - Install dependencies
    echo   run     - Run production server
    echo   build   - Build the application
)