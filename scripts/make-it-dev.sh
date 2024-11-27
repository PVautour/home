#!/bin/bash

# Directory to rename folders in (you can change this to the desired path)
TARGET_DIR="."

# Loop through each folder in the directory
for dir in "$TARGET_DIR"/*; do
    # Check if it is a directory
    if [ -d "$dir" ]; then
        # Get the basename of the directory
        base_dir=$(basename "$dir")
        
        # Rename the directory with 'dev-' prefix
        mv "$dir" "$TARGET_DIR/dev-$base_dir"
    fi
done

echo "All folders in $TARGET_DIR have been prefixed with 'dev-'"

