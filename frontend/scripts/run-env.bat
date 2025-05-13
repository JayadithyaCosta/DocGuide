@echo off
REM This is a simple wrapper script to run the environment-specific batch files

IF "%1"=="" (
    echo Usage: run-env.bat [dev^|staging^|prod]
    goto :eof
)

IF "%1"=="dev" (
    call dev.bat run
    goto :eof
)

IF "%1"=="staging" (
    call staging.bat run
    goto :eof
)

IF "%1"=="prod" (
    call prod.bat run
    goto :eof
)

echo Unknown environment: %1
echo Valid options are: dev, staging, prod