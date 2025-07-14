#!/bin/bash
set -e

GLOB_PATTERN="${1:-**/*.{md,yml,yaml,txt,py}}"

echo "Scanning files matching: $GLOB_PATTERN"

FILES=$(find . -type f \( -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.txt" -o -name "*.py" \))

for file in $FILES; do
  if grep -q 'https://github.com/dell/' "$file"; then
    echo "Updating $file"
    sed -i 's|https://github.com/dell/|https://eos2git.cec.lab.emc.com/CSM/|g' "$file"
  fi
done
