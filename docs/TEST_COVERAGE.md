# Test Coverage Guide

This document explains how to use and maintain test coverage in the DocGuide project.

## Backend Coverage

### Overview

Test coverage measures how much of your code is executed during tests. It helps identify untested code paths and ensures that new features and bug fixes are properly tested.

### Requirements

The project uses pytest and pytest-cov for test coverage:

```
pytest
pytest-cov
```

These dependencies are included in the backend's `requirements.txt` file.

### Running Tests with Coverage Locally

To run tests with coverage reporting:

```bash
# Basic coverage report
python -m pytest --cov=app tests/

# Detailed terminal report
python -m pytest --cov=app --cov-report=term tests/

# HTML report (creates coverage_html_report directory)
python -m pytest --cov=app --cov-report=html tests/

# XML report (for CI integration)
python -m pytest --cov=app --cov-report=xml tests/
```

### Coverage Configuration

The project includes a `.coveragerc` file in the backend directory that configures coverage settings:

- Source code to measure: `app` directory
- Excluded paths: tests, migrations, alembic
- Excluded lines: pragmas, imports, etc.

## Frontend Coverage

### Overview

For the React frontend, we use Vitest with coverage reporting to measure test coverage.

### Requirements

The project uses Vitest for testing and coverage. To enable coverage reporting, install the compatible coverage provider:

```bash
# Install with the correct version compatibility
npm install --save-dev @vitest/coverage-v8@0.34.6
```

Note: Make sure to use a version compatible with your installed Vitest version.

### Running Tests with Coverage Locally

To run tests with coverage reporting:

```bash
# From the frontend directory
npm run test:coverage

# To view coverage in watch mode
npm run test:watch -- --coverage
```

### Coverage Configuration

The project includes coverage configuration in the `vitest.config.ts` file:

- Coverage thresholds: 80% for statements, functions, and lines; 70% for branches
- Excluded paths: node_modules, test files, type definitions, etc.
- Report formats: text, HTML, LCOV, and JSON

## CI/CD Integration

The project's CI/CD pipeline enforces minimum coverage thresholds:

1. The CI workflow runs tests with coverage checks for both backend and frontend
2. PR checks include coverage reporting
3. The build will fail if coverage falls below the defined thresholds (80% for most metrics)

## Best Practices

1. **Write tests for new code**: Ensure all new features have tests
2. **Test edge cases**: Cover error conditions and boundary values
3. **Check coverage before submitting PRs**: Run coverage locally to identify gaps
4. **Don't just aim for percentages**: Focus on testing critical paths and business logic
5. **Update tests when refactoring**: Ensure tests still cover the same functionality

## Coverage Files and Git

Coverage files and directories are excluded from version control via `.gitignore` files:

### Backend
```
# Coverage
.coverage
coverage_html_report/
htmlcov/
.coverage.*
coverage.xml
*.cover
```

### Frontend
```
# Coverage
coverage/
.nyc_output/
coverage.json
```

These files are generated during local development and CI/CD runs, but don't need to be stored in the repository.

## Troubleshooting

### Backend

If you encounter issues with backend coverage reporting:

1. Ensure pytest-cov is installed: `pip install pytest-cov`
2. Check that you're running pytest from the correct directory
3. Verify that the `.coveragerc` file exists and is properly configured

### Frontend

If you encounter issues with frontend coverage reporting:

1. Ensure the coverage provider is installed with the correct version: `npm install --save-dev @vitest/coverage-v8@0.34.6`
2. If you encounter dependency conflicts, use `--legacy-peer-deps` flag: `npm install --save-dev @vitest/coverage-v8@0.34.6 --legacy-peer-deps`
3. Check that you're running tests from the frontend directory
4. Verify that the coverage configuration in `vitest.config.ts` is correct