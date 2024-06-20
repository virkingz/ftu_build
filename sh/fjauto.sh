#!/bin/bash

pwd
# 拷贝依赖库
cp lib/fjauto/* ./ftu
cd ftu
    ###sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" .gitmodules
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" cmake/GIT.cmake
    ###git submodule sync
# 获取子模块
    ###git submodule update --init --recursive

# 同步子模块远程仓库至本地
#git submodule update --remote

#rtthread
git clone --recursive -b v4.0.5 https://github.com/RT-Thread/rt-thread.git rtthread
#
git clone --recursive -b v1.9.1 https://github.com/STMicroelectronics/STM32CubeH7.git stm32hal
cp stm32hal/Drivers/CMSIS/DSP/Lib/GCC/libarm_cortexM7lfdp_math.a stm32hal/

#uffs
git clone --depth=1 https://github.com/RT-Thread-packages/uffs.git pkgs/uffs

#thread_pool
git clone --depth=1  https://github.com/armink-rtt-pkgs/thread_pool.git pkgs/thread_pool

bash useToFix.sh
