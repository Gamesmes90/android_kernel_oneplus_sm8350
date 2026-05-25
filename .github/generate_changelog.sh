#!/bin/bash

LAST_TAG=$(git describe --tags --abbrev=0)
CURRENT_TAG=$(git rev-parse --short HEAD)
REPO="https://github.com/Gamesmes90/android_kernel_oneplus_sm8350"

{
  echo ""
  git log $LAST_TAG..HEAD --format="- [%s]($REPO/commit/%H) - %an (%ad)"
} >> .github/release_notes.txt