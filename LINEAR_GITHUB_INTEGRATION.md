# Linear and GitHub Integration Guide

This document explains how to use Linear with GitHub for automated issue tracking and status updates.

## Overview

Our workflow integrates Linear (for issue tracking) with GitHub (for code management) to automatically update issue statuses based on PR activities.

## How It Works

1. **Linear Issue Creation**: Create an issue in Linear (e.g., "DOC-123: Implement login feature")
2. **Branch Creation**: Create a branch in GitHub that references the issue
3. **Pull Request**: When ready, create a PR with the Linear issue ID in the title
4. **Automated Updates**: GitHub Actions will run tests and update the Linear issue status

## Naming Conventions

### Branch Names

While not strictly required, it's helpful to include the Linear issue ID in your branch name:

```
feature/DOC-123-implement-login
bugfix/DOC-456-fix-auth-error
```

### Pull Request Titles

**IMPORTANT**: The PR title MUST include the Linear issue ID in square brackets:

```
[DOC-123] Implement login feature
[DOC-456] Fix authentication error
```

The GitHub Action looks for this pattern to extract the issue ID.

## GitHub Actions Workflow

Our workflow (`pr-checks.yml`) does the following:

1. Runs when a PR is opened or updated
2. Executes the test suite
3. Extracts the Linear issue ID from the PR title
4. Updates the Linear issue status based on test results:
   - Tests pass → Issue moves to "Done" state
   - Tests fail → Issue moves to "In Progress" state

## Setup Requirements

1. **Linear API Key**: Generate from Linear → Settings → API → Personal API keys
2. **GitHub Secrets**: Add these secrets to your GitHub repository:
   - `LINEAR_API_KEY`: Your Linear API key

## Testing the Integration

To test this integration:

1. Create an issue in Linear (note the ID, e.g., "DOC-123")
2. Create a branch and make changes
3. Create a PR with the title format: `[DOC-123] Your PR description`
4. The GitHub Action will run and update the Linear issue status

## Troubleshooting

- **Issue not updating**: Check that the PR title contains the issue ID in the correct format `[XXX-123]`
- **Action failing**: Check GitHub Action logs for errors
- **Wrong state transitions**: Verify that the state names in the workflow match your Linear workflow states

## Manual Testing

You can manually test the Linear API with:

```bash
curl --request POST \
  --url https://api.linear.app/graphql \
  --header "Authorization: Bearer YOUR_LINEAR_API_KEY" \
  --header "Content-Type: application/json" \
  --data '{"query": "query { viewer { id name } }"}'
```

## Best Practices

1. Always include the Linear issue ID in PR titles
2. Keep Linear issues updated with relevant information
3. Link to PRs in Linear issue comments for better traceability
4. Use Linear labels to categorize issues (bug, feature, etc.)

## Additional Resources

- [Linear API Documentation](https://developers.linear.app/docs/graphql/working-with-the-graphql-api)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)