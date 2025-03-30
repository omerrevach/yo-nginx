#!/bin/bash

REPO="omerrevach/yo-nginx"
TFVARS_FILE="terraform.tfvars"

upload_secret() {
  local key="$1"
  local value="$2"
  local secret_name="TF_VAR_${key}"

  echo "Setting $secret_name..."
  echo "$value" | gh secret set "$secret_name" --repo "$REPO"
}

echo "Uploading variables from $TFVARS_FILE to $REPO as GitHub Secrets..."

while IFS='=' read -r raw_key raw_value; do
  # Trim whitespace
  key=$(echo "$raw_key" | xargs)
  value=$(echo "$raw_value" | xargs)

  # Skip blank lines and comments
  [[ -z "$key" || "$key" == \#* ]] && continue

  # Handle quoted strings
  if [[ "$value" =~ ^\".*\"$ ]]; then
    value=$(echo "$value" | sed 's/^"//;s/"$//')

  # Handle arrays (already valid JSON)
  elif [[ "$value" =~ ^\[.*\]$ ]]; then
    value=$(echo "$value" | xargs)

  # Handle booleans
  elif [[ "$value" == "true" || "$value" == "false" ]]; then
    value="$value"
  fi

  upload_secret "$key" "$value"

done < "$TFVARS_FILE"

echo "done"
