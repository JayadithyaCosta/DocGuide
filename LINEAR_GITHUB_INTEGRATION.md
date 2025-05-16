# Linear and GitHub Integration Guide

This document explains how to use Linear with GitHub for automated issue tracking and status updates.

## Overview

Our workflow integrates Linear (for issue tracking) with GitHub (for code management) to automatically update issue statuses based on PR activities.

## How It Works

1. **Linear Issue Creation**: Create an issue in Linear (e.g., "ALPHA-15: Implement login feature")
2. **Branch Creation**: Create a branch in GitHub that references the issue
3. **Pull Request**: When ready, create a PR with the Linear issue ID in the title
4. **Automated Updates**: GitHub Actions will run tests and update the Linear issue status

## Naming Conventions

### Branch Names

While not strictly required, it's helpful to include the Linear issue identifier in your branch name:

```
feature/ALPHA-15-implement-login
bugfix/ALPHA-16-fix-auth-error
```

### Pull Request Titles

**IMPORTANT**: The PR title MUST include the Linear issue identifier in square brackets:

```
[ALPHA-15] Implement login feature
[ALPHA-16] Fix authentication error
```

The GitHub Action looks for this pattern to extract the issue identifier.

## GitHub Actions Workflow

Our workflow (`pr-checks.yml`) does the following:

1. Runs when a PR is opened or updated
2. Executes the test suite
3. Extracts the Linear issue identifier from the PR title (e.g., "ALPHA-15")
4. Queries the Linear API to find the actual issue ID using the identifier
5. Updates the Linear issue status based on test results:
   - Tests pass → Issue moves to "Done" state
   - Tests fail → Issue moves to "In Progress" state

## Setup Requirements

1. **Linear API Key**: Generate from Linear → Settings → API → Personal API keys
2. **GitHub Secrets**: Add these secrets to your GitHub repository:
   - `LINEAR_API_KEY`: Your Linear API key

## Testing the Integration

To test this integration:

1. Create an issue in Linear (note the identifier, e.g., "ALPHA-15")
2. Create a branch and make changes
3. Create a PR with the title format: `[ALPHA-15] Your PR description`
4. The GitHub Action will run and update the Linear issue status

## Troubleshooting

- **Issue not updating**: Check that the PR title contains the issue identifier in the correct format `[ALPHA-15]`
- **Action failing**: Check GitHub Action logs for errors
- **Wrong state transitions**: Verify that the state names in the workflow match your Linear workflow states
- **"Cannot iterate over null" error**: This usually means the issue identifier wasn't found in Linear. Make sure you're using the exact identifier from Linear.

## Debug Information

The workflow now includes detailed debug output to help troubleshoot issues:

1. It will show the extracted issue identifier
2. It will show the actual issue ID found in Linear
3. It will show the state ID being used
4. It will show the result of the update operation

## Manual Testing

You can manually test the Linear API with:

```bash
# Get your user info
curl --request POST \
  --url https://api.linear.app/graphql \
  --header "Authorization: Bearer YOUR_LINEAR_API_KEY" \
  --header "Content-Type: application/json" \
  --data '{"query": "query { viewer { id name } }"}'

# Find an issue by identifier
curl --request POST \
  --url https://api.linear.app/graphql \
  --header "Authorization: Bearer YOUR_LINEAR_API_KEY" \
  --header "Content-Type: application/json" \
  --data '{"query": "query { issues(filter: {identifier: {eq: \"ALPHA-15\"}}) { nodes { id title } } }"}'
```

## Best Practices

1. Always include the Linear issue identifier in PR titles
2. Keep Linear issues updated with relevant information
3. Link to PRs in Linear issue comments for better traceability
4. Use Linear labels to categorize issues (bug, feature, etc.)

## Additional Resources

- [Linear API Documentation](https://developers.linear.app/docs/graphql/working-with-the-graphql-api)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)