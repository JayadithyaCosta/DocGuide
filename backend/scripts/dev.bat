@echo off

REM Set environment file
set ENV_FILE=.env.dev

REM Change to the parent directory (backend root)
cd ..

IF "%1"=="install" (
    echo Installing backend dependencies...
    pip install -r requirements.txt
    goto :eof
)

IF "%1"=="run" (
    echo Starting backend development server with .env.dev...
    echo Server will be available at:
    echo   http://localhost:8000
    echo   http://127.0.0.1:8000
    for /f "tokens=4" %%a in ('ipconfig ^| findstr IPv4') do (
        if not defined _ip set "_ip=%%a"
    )
    if defined _ip echo   http://%_ip%:8000
    python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
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