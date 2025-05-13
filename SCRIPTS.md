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
│   │   └── run.js        # Node.js script for npm commands
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
cd backend/scripts
./dev.sh install  # Install dependencies
./dev.sh run      # Run development server
./dev.sh build    # Build the application

# Windows
cd backend\scripts
dev.bat install   # Install dependencies
dev.bat run       # Run development server
dev.bat build     # Build the application
```

### Staging Environment

```bash
# Unix/Linux/macOS
cd backend/scripts
./staging.sh install  # Install dependencies
./staging.sh run      # Run staging server
./staging.sh build    # Build the application

# Windows
cd backend\scripts
staging.bat install   # Install dependencies
staging.bat run       # Run staging server
staging.bat build     # Build the application
```

### Production Environment

```bash
# Unix/Linux/macOS
cd backend/scripts
./prod.sh install  # Install dependencies
./prod.sh run      # Run production server
./prod.sh build    # Build the application

# Windows
cd backend\scripts
prod.bat install   # Install dependencies
prod.bat run       # Run production server
prod.bat build     # Build the application
```

## Frontend Scripts

### Using npm Scripts

```bash
# Development
npm run start:dev

# Staging
npm run start:staging

# Production
npm run start:prod

# Build for different environments
npm run build           # Default build
npm run build:staging   # Staging build
npm run build:prod      # Production build
```

### Using Direct Scripts

```bash
# Unix/Linux/macOS
cd frontend/scripts
./dev.sh install      # Install dependencies
./dev.sh run          # Run development server
./dev.sh build        # Build for development

./staging.sh install  # Install dependencies
./staging.sh run      # Run staging server
./staging.sh build    # Build for staging

./prod.sh install     # Install dependencies
./prod.sh run         # Run production server
./prod.sh build       # Build for production

# Windows
cd frontend\scripts
dev.bat install       # Install dependencies
dev.bat run           # Run development server
dev.bat build         # Build for development

staging.bat install   # Install dependencies
staging.bat run       # Run staging server
staging.bat build     # Build for staging

prod.bat install      # Install dependencies
prod.bat run          # Run production server
prod.bat build        # Build for production
```

## Docker Compose (Full Stack)

Run both frontend and backend together using Docker Compose:

```bash
# Unix/Linux/macOS
cd scripts

# Development
./run-dev.sh

# Staging
./run-staging.sh

# Production
./run-prod.sh

# Windows
cd scripts

# Development
run-dev.bat

# Staging
run-staging.bat

# Production
run-prod.bat
```

## Environment Variables

Each environment uses its own .env file:

- Development: `.env.dev`
- Staging: `.env.staging`
- Production: `.env.production`

These files contain environment-specific configuration variables for both frontend and backend.