# SUSFS
SUSFS is implemented through a [patch](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd/blob/mainline/Patches/Patch/susfs_patch_to_5.4.patch) (with minor tweaks) and the ``legacy-susfs`` branch of [KernelSU Next](https://github.com/Gamesmes90/KernelSU-Next/tree/legacy-susfs)

SUSFS version: 2.2.0

Commit: [17dbf64255b576c7b8ae5ab6950ed8761e1b2f63](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/17dbf64255b576c7b8ae5ab6950ed8761e1b2f63)

Patch (exact commit): [susfs_patch_to_5.4.patch](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd/blob/cea906a15e59d4fc2913289720b3be5400b3b934/Patches/Patch/susfs_patch_to_5.4.patch)

### Notes

The patch workflow is managed by [susfs_patch.sh](../scripts/susfs/susfs_patch.sh)
```
          Download patch
               |
   checkout [detached HEAD] <- [upstream branch]
               |
           apply patch
               |
    fix rejected hunks with wiggle
               |
             commit
               |
     checkout [working branch]
               |
     cherry pick [detached commit hash]
```

### Sources
[NonGKI_Kernel_Build_2nd](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd) - Patch

[susfs4ksu](https://gitlab.com/simonpunk/susfs4ksu) - Original repository


### History

- SUSFS v2.1.0
    - [23d277527d6f19f90f239aa292a7cdcec86ab372](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/23d277527d6f19f90f239aa292a7cdcec86ab372)
    - [susfs_patch_to_5.4.patch](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd/blob/cd9891200d5bc8a84f6b95bd86b0d85e96bf2500/Patches/Patch/susfs_patch_to_5.4.patch)