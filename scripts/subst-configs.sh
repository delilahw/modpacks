#!/usr/bin/env bash

set -e

process_file() {
  local template_file="$1"
  local output_file="${template_file/.template/}"

  # Use envsubst to substitute variables and write to the output file
  echo "Processing $template_file -> $output_file"
  envsubst <"$template_file" >"$output_file"

  git diff --no-index "$template_file" "$output_file" || true

  # Validate the output file
  validate_file "$output_file"
}

validate_file() {
  local file="$1"

  echo "Validating $file"

  # If file is json, use jq to minify
  if [[ $file == *.json ]]; then
    jq -c '.' "$file" | sponge "$file"
  fi
}

export -f process_file
export -f validate_file

# Set the config directory to the first argument or default to the current directory
target_dir="${1:-.}"

# Find all *.template.json files in the config directory and process them
find "$target_dir" -type f -name '*.template.json' -exec bash -c 'process_file "$0"' {} \;
