#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
# This script applies the SUSFS patch for kernel version 5.4
# Workflow:
#          Download patch
#               |
#   checkout [detached HEAD] <- [upstream branch]
#               |
#           apply patch
#               |
#    fix rejected hunks with wiggle
#               |
#             commit
#               |
#     checkout [working branch]
#               |
#     cherry pick [detached commit hash]
#
# This way 95% of the patching is done automatically
# The only manual work remaining would be fixing any merge conficts and adjusting the code if needed
#
# Patch: https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd/blob/mainline/Patches/Patch/susfs_patch_to_5.4.patch

DIR=scripts/susfs
PATCH_FILE=susfs_patch_to_5.4.patch
UPSTREAM=lineage-23.2
TARGET=android-16

set -euo pipefail

if [[ -z "${1:-}" ]] then
    echo "No commit message provided."
    exit 1
fi

# Download patch from HEAD
curl -O https://raw.githubusercontent.com/JackA1ltman/NonGKI_Kernel_Build_2nd/refs/heads/mainline/Patches/Patch/$PATCH_FILE

# Save new hash (for documentation)
echo  $(curl -s \
        "https://api.github.com/repos/JackA1ltman/NonGKI_Kernel_Build_2nd/commits?path=Patches/Patch/susfs_patch_to_5.4.patch&sha=mainline&per_page=1" \
        | jq -r '.[0].sha') > $DIR/patch_hash

# Detach with upstream branch as base
git checkout --detach $UPSTREAM

# Apply the patch
git apply --reject --whitespace=fix $PATCH_FILE || true

# Check for rej files and merge them
rejs_found=0
while IFS= read -r -d '' rej; do
    rejs_found=1
    orig="${rej%.rej}"
    echo "Found reject file. Running wiggle on: $orig"
    
    if [ -f "$orig" ]; then
        if wiggle --replace "$orig" "$rej"; then
            echo "   Wiggle merged $orig successfully"
            rm -f "$rej" "$orig.porig"
        else
            echo "   Wiggle failed to merge $orig"
            rm -f "$orig.porig"
        fi
    else
        echo "   Error: The original file $orig for $rej does not exist"
    fi
done < <(find . -type f -name "*.rej" -print0)

# Output if no rej files are found
if [ "$rejs_found" -eq 0 ]; then
    echo "No .rej files found (the patch has been 100% applied or it failed from the start)."
fi

# Commit
git add -u && git add '*.h' '*.c' 'Makefile'
git commit -am "$1"

# Get commit hash
HASH=$(git rev-parse --short HEAD)

# Delete patch file
rm $PATCH_FILE

# Checkout to working branch
git checkout $TARGET

# Cherry pick the detached commit
git cherry-pick $HASH

exit 0