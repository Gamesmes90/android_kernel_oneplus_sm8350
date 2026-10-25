#!/bin/bash

if [ "${1:-}" = "bakasu" ]; then
    curl -LSs "https://raw.githubusercontent.com/Baka-SU/BakaSU/main/kernel/setup.sh" | bash
    exit 0
fi

if [ "${1:-}" = "susfs" ]; then
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy-susfs
else
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy
fi

# Removing ksu_handle_post_execveat as it doesn't exist in KernelSU Next
sed -i '/__attribute__((hot))/{N;N;/ksu_handle_post_execveat/d;}' fs/exec.c
sed -i '/	ksu_handle_post_execveat(&fd, &filename, &argv, &envp, &flags, &retval);/d' fs/exec.c

# Spoofing if needed
sed -i 's|KSU_GIT_TAG := $(shell cd $(GIT_ROOT) && $(LPATH) git describe --tags --abbrev=0 2>/dev/null)|KSU_GIT_TAG := v3.4.2-legacy|g' KernelSU-Next/kernel/Kbuild
sed -i 's|KSU_GIT_VERSION := $(shell cd $(GIT_ROOT) && $(LPATH) git rev-list --count HEAD 2>/dev/null)|KSU_GIT_VERSION := 3066|g' KernelSU-Next/kernel/Kbuild