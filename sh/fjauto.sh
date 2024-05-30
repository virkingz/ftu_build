#!/bin/bash

pwd
# 拷贝依赖库
cp lib/fjauto/* ./ftu
cd ftu
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" .gitmodules
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" cmake/GIT.cmake
git submodule sync
# 获取子模块
git submodule update --init --recursive

# 同步子模块远程仓库至本地
git submodule update --remote

#rtthread
git clone --recursive -b v4.0.5 https://github.com/RT-Thread/rt-thread.git rtthread
#
git clone --recursive -b v1.9.1 git@e.coding.net:yu308/project/STM32CubeH7.git stm32hal
cp stm32hal/Drivers/CMSIS/DSP/Lib/GCC/libarm_cortexM7lfdp_math.a stm32hal/


# 修改 stdio 注释第67行
sed -i -e '67 s/^/\/\//' rtthread/components/libc/compilers/gcc/newlib/stdio.c

# 修改 uffs
sed -i "s/st_atime/atime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/uffs/uffs_fd.c
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/uffs/uffs_fd.c

sed -i "s/st_atime/atime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_mtime/mtime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h
sed -i "s/st_ctime/ctime/g" pkgs/uffs/src/inc/uffs/uffs_fd.h

sed -i '20i #include <string.h>' rtthread/components/drivers/include/drivers/mtd_nand.h

cd module/FASchemes
git checkout 51826fb3b911543fb0eabb0b6c78c239f94fcf70
