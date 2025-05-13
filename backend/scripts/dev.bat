@echo off

REM Set environment file
set ENV_FILE=.env.dev

IF "%1"=="install" (
    echo Installing backend dependencies...
    pip install -r ..\requirements.txt
    goto :eof
)

IF "%1"=="run" (
    echo Starting backend development server with .env.dev...
    uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
    goto :eof
)

IF "%1"=="build" (
    echo Building backend application with .env.dev...
    REM Add build steps here if needed
    echo Build completed
    goto :eof
)

IF "%1"=="" (
    echo Usage: scripts\dev.bat [install^|run^|build]
    echo   install - Install dependencies
    echo   run     - Run development server
    echo   build   - Build the application
)