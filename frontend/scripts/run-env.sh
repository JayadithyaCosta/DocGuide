#!/bin/bash
# This is a simple wrapper script to run the environment-specific shell scripts

if [ -z "$1" ]; then
    echo "Usage: ./run-env.sh [dev|staging|prod]"
    exit 1
fi

case "$1" in
    dev)
        ./dev.sh run
        ;;
    staging)
        ./staging.sh run
        ;;
    prod)
        ./prod.sh run
        ;;
    *)
        echo "Unknown environment: $1"
        echo "Valid options are: dev, staging, prod"
        exit 1
        ;;
esac