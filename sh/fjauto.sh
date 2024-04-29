#!/bin/bash

cd ftu
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" .gitmodules
sed -i "s#https://e.coding.net/yu308#git@e.coding.net:yu308#g" cmake/GIT.cmake

# 获取子模块
git submodule update --init --recursive

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
