#!/bin/bash

REPO="omerrevach/yo-nginx"
TFVARS_FILE="terraform.tfvars"

echo "Uploading"

# Loop through each line
while IFS= read -r line; do
  # Skip empty lines and comments
  [[ -z "$line" || "$line" == \#* ]] && continue

  # Extract key and value exactly
  key=$(echo "$line" | cut -d '=' -f1 | xargs)
  value=$(echo "$line" | cut -d '=' -f2- | xargs)

  # Add secret to GitHub
  secret_name="TF_VAR_$key"
  echo "Setting $secret_name"
  gh secret set "$secret_name" --body "$value" --repo "$REPO"

done < "$TFVARS_FILE"

echo "updated"
