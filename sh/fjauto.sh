#!/bin/bash

cd ftu
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" .gitmodules
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" cmake/GIT.cmake
git submodule sync
# 获取子模块
git submodule update --init --recursive

#rtthread
git clone --recursive -b v5.0.2 https://github.com/RT-Thread/rt-thread.git rtthread
#
git clone --recursive -b v1.9.1 git@e.coding.net:yu308/project/STM32CubeH7.git stm32hal
cp stm32hal/Drivers/CMSIS/DSP/Lib/GCC/libarm_cortexM7lfdp_math.a stm32hal/

#uffs
git clone https://gitee.com/RT-Thread-Mirror/uffs.git pkgs/uffs
git clone https://gitee.com/RT-Thread-Mirror/CmBacktrace.git pkgs/cmbacktrace

# 修改 uffs
sed -i "s/st_atime/atime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/uffs/uffs_fd.c

sed -i "s/st_atime/atime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h

# 修改 wiznet
sed -i 's/RT_WEAK/rt_weak/g' pkgs/wiznet/src/wiz.c
sed -i 's/dfs_fd/dfs_file/g' pkgs/wiznet/src/wiz_af_inet.c


# 修改 cmbacktrace
sed -i 's/RT_WEAK/rt_weak/g' pkgs/cmbacktrace/cmb_port.c

# 修改 RTT ctime.c
sed -i '1,751d' rtthread/components/libc/compilers/common/ctime.c

# 拷贝依赖库
cp ../lib/fjauto/* ./
