#!/bin/bash

# SHREDS ALL HIDDEN .CTB~ FILES IN YOUR HOME DIRECTORY, RECURSIVELY

# .ctb is a format used in cherrytree
# hidden .ctb~ files are used for

marked_files=()

# accumulate the filepaths to shred
while IFS= read -r -d $'\0' file; do
marked_files+=("$(realpath "$file")")
done < <(find "$HOME" -type f -name "*.ctb~*" -print0)

# shred the filepaths
if [ ${#marked_files[@]} -gt 0 ]; then
for file in "${marked_files[@]}"; do
shred -zun 100  "$file"
echo "Shredded:$file" #comment this line out if you don't want confirmation
done
echo "Files removed successfully"
else
echo "No files found"
fi
