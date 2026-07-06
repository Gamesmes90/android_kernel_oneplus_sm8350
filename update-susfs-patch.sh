#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No argument provided. Provide remote commit hash."
  exit 1
fi

# Head
curl -o new-patch.patch https://raw.githubusercontent.com/JackA1ltman/NonGKI_Kernel_Build_2nd/refs/heads/mainline/Patches/Patch/susfs_patch_to_5.4.patch

# Old Patch
curl -o old-patch.patch https://raw.githubusercontent.com/JackA1ltman/NonGKI_Kernel_Build_2nd/${1:-}/Patches/Patch/susfs_patch_to_5.4.patch

git merge-file susfs_patch_to_5.4.patch old-patch.patch new-patch.patch