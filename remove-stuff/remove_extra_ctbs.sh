#!/bin/bash

# REMOVES ALL HIDDEN .CTB~ FILES IN YOUR HOME DIRECTORY, RECURSIVELY

# .ctb is a format used in cherrytree
# hidden .ctb~ files are used for backups

marked_files=()

# accumulate the filepaths to remove with rm
while IFS= read -r -d $'\0' file; do
marked_files+=("$(realpath "$file")")
done < <(find "$HOME" -type f -name "*.ctb~*" -print0)

# remove the accumulated filepaths
if [ ${#marked_files[@]} -gt 0 ]; then
for file in "${marked_files[@]}"; do
rm  "$file"
echo "Removed:$file" #comment this line out if you don't want confirmation
done
echo "Files removed successfully"
else
echo "No files found"
fi
