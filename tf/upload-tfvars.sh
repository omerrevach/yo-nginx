#!/bin/bash

# Change these to your GitHub info
REPO="https://github.com/omerrevach/yo-nginx.git"
TFVARS_FILE="terraform.tfvars"

echo "uploading tfvars to github"

# Go through each line in the file
while read line; do
  # Skip blank lines and comments
  if [[ "$line" == "" || "$line" == \#* ]]; then
    continue
  fi
  
  # Split into key and value parts
  key=$(echo "$line" | cut -d '=' -f1 | tr -d ' ')
  value=$(echo "$line" | cut -d '=' -f2- | tr -d ' "')
  
  # Name the secret with TF_VAR prefix
  secret_name="TF_VAR_$key"
  
  echo "adding secret: $secret_name"
  gh secret set "$secret_name" --body "$value" --repo "$REPO"
done < "$TFVARS_FILE"

echo "in guthub secrets"