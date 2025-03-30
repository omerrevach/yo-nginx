#!/bin/bash

REPO="omerrevach/yo-nginx"
TFVARS_FILE="terraform.tfvars"

echo "Uploading"

while IFS='=' read -r key value; do
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)

  # Skip empty lines or comments
  if [[ -z "$key" || "$key" == \#* ]]; then
    continue
  fi

  # Detect array and keep as is, otherwise strip quotes
  if [[ "$value" =~ ^\[.*\]$ ]]; then
    true
  elif [[ "$value" =~ ^\".*\"$ ]]; then
    value=$(echo "$value" | sed 's/^"//;s/"$//')
  fi

  secret_name="TF_VAR_${key}"

  echo "Setting $secret_name..."
  echo "$value" | gh secret set "$secret_name" --repo "$REPO"
done < "$TFVARS_FILE"

echo "Done"
