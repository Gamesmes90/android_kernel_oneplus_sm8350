#!/bin/bash

if [ "${1:-}" = "susfs" ]; then
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy-susfs
else
    curl -LSs "https://raw.githubusercontent.com/Gamesmes90/KernelSU-Next/refs/heads/stable-susfs/kernel/setup.sh" | bash -s legacy
fi