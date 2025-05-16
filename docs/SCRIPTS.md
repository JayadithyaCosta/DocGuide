# DocGuide Scripts Guide

This document provides instructions on how to use the various scripts for development, staging, and production environments.

## Project Structure

```
DocGuide/
├── backend/
│   ├── scripts/
│   │   ├── dev.bat       # Windows development script
│   │   ├── dev.sh        # Unix development script
│   │   ├── staging.bat   # Windows staging script
│   │   ├── staging.sh    # Unix staging script
│   │   ├── prod.bat      # Windows production script
│   │   └── prod.sh       # Unix production script
├── frontend/
│   ├── scripts/
│   │   ├── dev.bat       # Windows development script
│   │   ├── dev.sh        # Unix development script
│   │   ├── staging.bat   # Windows staging script
│   │   ├── staging.sh    # Unix staging script
│   │   ├── prod.bat      # Windows production script
│   │   ├── prod.sh       # Unix production script
│   │   ├── run-env.bat   # Windows environment runner
│   │   └── run-env.sh    # Unix environment runner
└── scripts/              # Project-wide scripts
    ├── run-dev.bat       # Windows Docker Compose development script
    ├── run-dev.sh        # Unix Docker Compose development script
    ├── run-staging.bat   # Windows Docker Compose staging script
    ├── run-staging.sh    # Unix Docker Compose staging script
    ├── run-prod.bat      # Windows Docker Compose production script
    └── run-prod.sh       # Unix Docker Compose production script
```

## Backend Scripts

### Development Environment

```bash
# Unix/Linux/macOS
cd backend
./scripts/dev.sh install  # Install dependencies
./scripts/dev.sh run      # Run development server
./scripts/dev.sh build    # Build the application

# Windows
cd backend
scripts\dev.bat install   # Install dependencies
scripts\dev.bat run       # Run development server
scripts\dev.bat build     # Build the application
```

### Staging Environment

```bash
# Unix/Linux/macOS
cd backend
./scripts/staging.sh install  # Install dependencies
./scripts/staging.sh run      # Run staging server
./scripts/staging.sh build    # Build the application

# Windows
cd backend
scripts\staging.bat install   # Install dependencies
scripts\staging.bat run       # Run staging server
scripts\staging.bat build     # Build the application
```

### Production Environment

```bash
# Unix/Linux/macOS
cd backend
./scripts/prod.sh install  # Install dependencies
./scripts/prod.sh run      # Run production server
./scripts/prod.sh build    # Build the application

# Windows
cd backend
scripts\prod.bat install   # Install dependencies
scripts\prod.bat run       # Run production server
scripts\prod.bat build     # Build the application
```

## Frontend Scripts

### Using npm Scripts

```bash
# Development
cd frontend
npm run start:dev

# Staging
cd frontend
npm run start:staging

# Production
cd frontend
npm run start:prod

# Build for different environments
npm run build           # Default build
npm run build:staging   # Staging build
npm run build:prod      # Production build
```

### Using Direct Scripts

```bash
# Unix/Linux/macOS
cd frontend
./scripts/dev.sh install      # Install dependencies
./scripts/dev.sh run          # Run development server
./scripts/dev.sh build        # Build for development

./scripts/staging.sh install  # Install dependencies
./scripts/staging.sh run      # Run staging server
./scripts/staging.sh build    # Build for staging

./scripts/prod.sh install     # Install dependencies
./scripts/prod.sh run         # Run production server
./scripts/prod.sh build       # Build for production

# Windows
cd frontend
scripts\dev.bat install       # Install dependencies
scripts\dev.bat run           # Run development server
scripts\dev.bat build         # Build for development

scripts\staging.bat install   # Install dependencies
scripts\staging.bat run       # Run staging server
scripts\staging.bat build     # Build for staging

scripts\prod.bat install      # Install dependencies
scripts\prod.bat run          # Run production server
scripts\prod.bat build        # Build for production
```

## Docker Compose (Full Stack)

Run both frontend and backend together using Docker Compose:

```bash
# Unix/Linux/macOS
# Development
cd scripts
./run-dev.sh

# Staging
cd scripts
./run-staging.sh

# Production
cd scripts
./run-prod.sh

# Windows
# Development
cd scripts
run-dev.bat

# Staging
cd scripts
run-staging.bat

# Production
cd scripts
run-prod.bat
```

## Environment Variables

Each environment uses its own .env file:

- Development: `.env.dev`
- Staging: `.env.staging`
- Production: `.env.production`

These files contain environment-specific configuration variables for both frontend and backend.

## Troubleshooting

### Module Resolution Issues

If you encounter module resolution issues with the backend:

1. Make sure you're running the scripts from the correct directory
2. The scripts use `python -m uvicorn` to ensure proper module resolution

### Frontend Script Issues

If you encounter issues with the frontend scripts:

1. For npm scripts, make sure you're in the frontend directory
2. The npm scripts use batch/shell wrappers to run the environment-specific scripts
3. You can also run the scripts directly from the scripts directory