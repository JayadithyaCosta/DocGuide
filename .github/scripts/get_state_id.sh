#!/bin/bash

# This script finds the Linear state ID for a given state name
# Usage: ./get_state_id.sh "Done"

STATE_NAME=$1
LINEAR_API_KEY=$2
ISSUE_ID=$3

# Get the issue data from Linear
ISSUE_DATA=$(curl --silent --request POST \
  --url https://api.linear.app/graphql \
  --header "Authorization: Bearer $LINEAR_API_KEY" \
  --header "Content-Type: application/json" \
  --data "{
    \"query\": \"query { issue(id: \\\"$ISSUE_ID\\\") { team { states { id name } } } }\"
  }")

# Extract the state ID from the issue data
STATE_ID=$(echo "$ISSUE_DATA" | jq -r ".data.issue.team.states[] | select(.name==\"$STATE_NAME\") | .id")

echo "$STATE_ID"