# Test Coverage Guide

This document explains how to use and maintain test coverage in the DocGuide project.

## Overview

Test coverage measures how much of your code is executed during tests. It helps identify untested code paths and ensures that new features and bug fixes are properly tested.

## Requirements

The project uses pytest and pytest-cov for test coverage:

```
pytest
pytest-cov
```

These dependencies are included in the backend's `requirements.txt` file.

## Running Tests with Coverage Locally

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

## Coverage Configuration

The project includes a `.coveragerc` file in the backend directory that configures coverage settings:

- Source code to measure: `app` directory
- Excluded paths: tests, migrations, alembic
- Excluded lines: pragmas, imports, etc.

## CI/CD Integration

The project's CI/CD pipeline enforces a minimum coverage threshold:

1. The CI workflow runs tests with `--cov-fail-under=80`
2. PR checks include coverage reporting
3. The build will fail if coverage falls below 80%

## Best Practices

1. **Write tests for new code**: Ensure all new features have tests
2. **Test edge cases**: Cover error conditions and boundary values
3. **Check coverage before submitting PRs**: Run coverage locally to identify gaps
4. **Don't just aim for percentages**: Focus on testing critical paths and business logic
5. **Update tests when refactoring**: Ensure tests still cover the same functionality

## Troubleshooting

If you encounter issues with coverage reporting:

1. Ensure pytest-cov is installed: `pip install pytest-cov`
2. Check that you're running pytest from the correct directory
3. Verify that the `.coveragerc` file exists and is properly configured