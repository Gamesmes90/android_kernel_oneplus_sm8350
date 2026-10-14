# KernelSU
KernelSU is implemented through a series of manual hooks.
This allows for better stability and root hiding.

Mode: [Manual](../arch/arm64/configs/vendor/lahaina-qgki_defconfig#L994)

Available with
- [KernelSU Next](https://github.com/KernelSU-Next/KernelSU-Next)
    - Branch: [Legacy](../scripts/init_ksu.sh)
- [BakaSU]()

## [stat.c](../fs/stat.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_newfstat_ret        | newfstat            |
| ksu_handle_stat                | newfstatat          |
| ksu_handle_fstat64_ret         | fstat64             |
| ksu_handle_stat                | fstatat64           |

Commit: [fd187a11ce18a37805b71591c2e16076e64b7045](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/fd187a11ce18a37805b71591c2e16076e64b7045)

## [exec.c](../fs/exec.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_execveat            | do_execveat_common  |
| ksu_handle_post_execveat       | do_execveat_common  |

**Note**: ``ksu_handle_post_execveat`` hook is only available with BakaSU

Commit: [aec2275b5dd36f1d828b4cde1c2dc55b1306201f](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/aec2275b5dd36f1d828b4cde1c2dc55b1306201f)

## [open.c](../fs/open.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_faccessat           | faccessat           |

Commit: [aefe34cafa4b989134baea764b22156a8fb2970f](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/aefe34cafa4b989134baea764b22156a8fb2970f)

## [reboot.c](../kernel/reboot.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_sys_reboot          | reboot              |

Commit: [c08edaca17c94c0dbb1b753ba535e3c22dde7b84](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/c08edaca17c94c0dbb1b753ba535e3c22dde7b84)

## [input.c](../drivers/input/input.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_input_handle_event  | input_event         |

Commit: [6b8e11293633b1620b35326a11286c850370be67](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/6b8e11293633b1620b35326a11286c850370be67)

## [sys.c](../kernel/sys.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_setresuid           | __sys_setresuid     |

Commit: [061485764b9a17dda2f8d715b4c32ac1d32b851f](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/061485764b9a17dda2f8d715b4c32ac1d32b851f)

## [read_write.c](../fs/read_write.c)
| Hook                           | Function            |
|--------------------------------|---------------------|
| ksu_handle_sys_read           | read     |

Commit: [097280da2b24dfabd468eaa73917719ffe0f825c](https://github.com/Gamesmes90/android_kernel_oneplus_sm8350/commit/097280da2b24dfabd468eaa73917719ffe0f825c)

**Important Note**: Upstream KernelSU Next has removed ``legacy-susfs`` branch. That branch is now maintained [here](https://github.com/Gamesmes90/KernelSU-Next/tree/legacy-susfs). This change is reflected in the [init_ksu.sh](../scripts/init_ksu.sh) script.

### Sources
[BakaSU hooks](https://bakasu.org/guide/manual-integrate)