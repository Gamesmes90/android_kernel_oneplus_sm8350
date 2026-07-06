#!/bin/bash

if [ $# -eq 0 ]; then
  echo "No argument provided. Provide commit hash to revert."
  exit 1
fi

# Revert old patch
git revert --no-edit ${1:-}

# Apply new patch
patch -p1 < susfs_patch_to_5.4.patch