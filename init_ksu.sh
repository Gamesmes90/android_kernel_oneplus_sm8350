#!/bin/bash

if [ "${1:-}" = "susfs" ]; then
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy-susfs
else
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy
fi

# Spoof KSU Next to version 3.3.0
sed -i 's|KSU_GIT_TAG := $(shell cd $(GIT_ROOT) && $(LPATH) git describe --tags --abbrev=0 2>/dev/null)|KSU_GIT_TAG := v3.3.0|g' KernelSU-Next/kernel/Kbuild
sed -i 's|KSU_GIT_VERSION := $(shell cd $(GIT_ROOT) && $(LPATH) git rev-list --count HEAD 2>/dev/null)|KSU_GIT_VERSION := 3014|g' KernelSU-Next/kernel/Kbuild