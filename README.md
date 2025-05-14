# DocGenius

Document management and analysis system.

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment:

### Continuous Integration (CI)

The CI workflow runs automatically on:
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

The workflow:
1. Detects which part of the codebase has changed (frontend, backend, or both)
2. Runs appropriate tests based on the changes
3. For backend changes:
   - Sets up a PostgreSQL database
   - Runs Python tests with pytest
   - Generates coverage reports
4. For frontend changes:
   - Runs ESLint for code quality
   - Runs Vitest for unit tests

### Continuous Deployment (CD)

The CD workflow runs automatically on:
- Push to the `main` branch

The workflow:
1. Builds Docker images for both frontend and backend
2. Pushes images to Docker Hub
3. (Optional) Deploys to staging/production server

## Setting Up GitHub Secrets

For the CD workflow to work, you need to set up the following secrets in your GitHub repository:

- `DOCKER_HUB_USERNAME`: Your Docker Hub username
- `DOCKER_HUB_TOKEN`: Your Docker Hub access token

For deployment to a server (if enabled):
- `SSH_HOST`: The hostname or IP of your server
- `SSH_USERNAME`: The SSH username
- `SSH_PRIVATE_KEY`: The SSH private key for authentication