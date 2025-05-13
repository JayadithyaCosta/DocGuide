@echo off

REM Set environment file
set ENV_FILE=.env.staging

REM Change to the parent directory (backend root)
cd ..

IF "%1"=="install" (
    echo Installing backend dependencies...
    pip install -r requirements.txt
    goto :eof
)

IF "%1"=="run" (
    echo Starting backend staging server with .env.staging...
    python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
    goto :eof
)

IF "%1"=="build" (
    echo Building backend application with .env.staging...
    REM Add build steps here if needed
    echo Build completed
    goto :eof
)

IF "%1"=="" (
    echo Usage: scripts\staging.bat [install^|run^|build]
    echo   install - Install dependencies
    echo   run     - Run staging server
    echo   build   - Build the application
)