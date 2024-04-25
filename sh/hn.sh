#!/bin/bash
cd ftu
git clone --depth=1 git@e.coding.net:yu308/project/STM32CubeF4.git stm32hal
cp stm32hal/Drivers/CMSIS/Lib/GCC/libarm_cortexM4lf_math.a stm32hal/
git clone git@e.coding.net:yu308/project/rtthread-nano.git rtthread
git clone https://gitee.com/RT-Thread-Mirror/uffs.git pkgs/uffs
git clone git@e.coding.net:yu308/project/cJSON.git pkgs/cjson

#修改 uffs
sed -i "s/st_atime/atime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/uffs/uffs_fd.c

sed -i "s/st_atime/atime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h

#修改 finsh_port.c
sed -i "24c //" rtthread/rt-thread/components/finsh/finsh_port.c
