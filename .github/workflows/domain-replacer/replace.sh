# #!/bin/bash
# set -e

# GLOB_PATTERN="${1:-**/*.{md,yml,yaml,txt,py,go,sh}}"

# echo "Scanning files matching: $GLOB_PATTERN"


# FILES=$(find . -type f \( -name "*.md" -o -name "*.yml" -o -name "*.yaml" -o -name "*.txt" -o -name "*.py" \) ! -path "./.github/workflows/*")

# echo "$FILES"


# for file in $FILES; do
#   if grep -q 'github.com/dell/' "$file"; then
#     echo "Updating $file"
#     sed -i 's|github.com/dell/|eos2git.cec.lab.emc.com/CSM/|g' "$file"
#   fi
# done

#!/bin/bash
set -e

echo "Scanning for files to update..."


find . -type f ! -path "./.github/workflows/*" | while read -r file; do
  echo "Checking $file"
  if grep -q 'github.com/dell/' "$file"; then
    echo "Updating $file"
    sed -i 's|github.com/dell/|eos2git.cec.lab.emc.com/CSM/|g' "$file"
  fi
done



