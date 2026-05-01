# KernelSU Next
KernelSU Next is implemented through a series of manual hooks

| File                                                           | Hook                           | Function            |
|----------------------------------------------------------------|--------------------------------|---------------------|
| [ fs/exec.c ]( ./fs/exec.c#L1907-L1923 )                       | ksu_handle_execveat_ksud<br>ksu_handle_execveat_sucompat              | do _execveat_common |
| [ fs/read_write.c ]( ./fs/read_write.c#L595-L605 )             | ksu_handle_sys_read            | read                |
| [ fs/stat.c ]( ./fs/stat.c#L272-L285 )                         | ksu_handle_vfs_fstat           | fstat               |
| [ fs/stat.c ]( ./fs/stat.c#L377-L382 )                         | ksu_handle_stat                | newfstatat          |
| [ fs/open.c ]( ./fs/open.c#L348-L365 )                         | ksu_handle_faccessat           | do_faccessat        |
| [ drivers/input/input.c ]( ./drivers/input/input.c#L445-L458 ) | ksu_handle_input_handle_event  | input_event         |
| [ kernel/sys.c ]( ./kernel/sys.c#L620-L638 )                   | ksu_handle_setresuid           | __sys_setresuid     |
| [ kernel/reboot.c ]( ./kernel/reboot.c#L305-L325 )             | ksu_handle_sys_reboot          | reboot              |

KernelSU Next Branch: [Legacy](./init_ksu.sh)

### Sources
[ÆSIR Kernel](https://github.com/bcrtvkcs/aesir_kernel_oneplus_sm8350)
[KernelSU non-gki integration](https://kernelsu.org/guide/how-to-integrate-for-non-gki.html)
[KernelSU Next non-gki integration](https://kernelsu-next.github.io/webpage/pages/how-to-integrate-for-non-gki.html)
[ReSukiSU hooks](https://resukisu.github.io/guide/manual-integrate.html)