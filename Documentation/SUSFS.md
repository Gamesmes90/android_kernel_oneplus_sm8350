# SUSFS
SUSFS is implemented through a [patch](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd/blob/mainline/Patches/Patch/susfs_patch_to_5.4.patch) with minor tweaks and with one of the following KernelSU forks depending on the type of build
- [KernelSU Next](https://github.com/Gamesmes90/KernelSU-Next/tree/legacy-susfs) ``-ksun``
- [BakaSU](https://github.com/Baka-SU/BakaSU) ``-bakasu``

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

### Notes

All configs entries with prefix ``CONFIG_KSU_SUSFS`` have been changed to ``CONFIG_SUSFS`` to avoid conflicts with [BakaSU SUSFS Inline Hook](https://bakasu.org/guide/build#susfs)

All SUSFS related commits [here](https://github.com/search?q=repo%3AGamesmes90%2Fandroid_kernel_oneplus_sm8350+SUSFS&type=commits)

### Sources
[NonGKI_Kernel_Build_2nd](https://github.com/JackA1ltman/NonGKI_Kernel_Build_2nd) - Patch

[susfs4ksu](https://gitlab.com/simonpunk/susfs4ksu) - Original repository