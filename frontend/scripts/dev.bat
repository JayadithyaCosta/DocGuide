@echo off

REM Set environment file
set ENV_FILE=.env.dev

REM Change to the parent directory (frontend root)
cd ..

IF "%1"=="install" (
    echo Installing frontend dependencies...
    npm install
    goto :eof
)

IF "%1"=="run" (
    echo Starting frontend development server with .env.dev...
    npm run dev
    goto :eof
)

IF "%1"=="build" (
    echo Building frontend application with .env.dev...
    npm run build
    goto :eof
)

IF "%1"=="" (
    echo Usage: scripts\dev.bat [install^|run^|build]
    echo   install - Install dependencies
    echo   run     - Run development server
    echo   build   - Build the application
)