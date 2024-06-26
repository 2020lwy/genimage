#!/usr/bin/env bash

# imx-atf的仓库地址：git clone -b imx_5.4.70_2.3.0 https://github.com/nxp-imx/imx-atf.git  
# export CROSS_COMPILE=aarch64-none-linux-gnu-
# make PLAT=imx8mp bl31
#编译imx-atf 将bl31.bin文件拷贝到imx-mkimage目录下的iMX8M目录下
# cp  /home/lwy/img/flash_bin/imx-atf/build/imx8mp/release/bl31.bin  ./imx-mkimage/iMX8M

#firmware的下载地址：https://www.nxp.com.cn/lgfiles/NMG/MAD/YOCTO/firmware-imx-8.18.bin
#下载后 chmod a+x firmware-imx-8.18.bin  然后执行./firmware-imx-8.18.bin即可在对应的目录下找到ddr目录，对应能找到响应的ddr固件
#编译firm-imx-8.18 将ddr相关的固件拷贝到imx-mkiamge目录下的iMX8M目录下
# cp  /home/lwy/img/flash_bin/firmware-imx-8.18/firmware/ddr/synopsys/lpddr4_pmu_train_*202006.bin  ./imx-mkimage/iMX8M

../u-boot-8mplus/tools/mkimage -C none -A arm -T script -d ./boot.cmd ./boot.scr
#../u-boot-8mplus/tools/mkimage -C none -A arm -T script -d ./boot_bac.cmd ./boot.scr
cp ./boot.scr /home/lwy/img/genimg/input
cp ./boot.scr /opt/tftpboot

# 将uboot的必要文件拷贝到imx-mkimage目录下的iMX8M目录下 
cp  ../u-boot-8mplus/tools/mkimage   ./imx-mkimage/iMX8M/mkimage_uboot
cp  ../u-boot-8mplus/u-boot-nodtb.bin  ./imx-mkimage/iMX8M
cp  ../u-boot-8mplus/spl/u-boot-spl.bin  ./imx-mkimage/iMX8M
cp  ../u-boot-8mplus/arch/arm/dts/imx8mp-evk-test.dtb  ./imx-mkimage/iMX8M/fsl-imx8mp-evk.dtb

sync

cd  ./imx-mkimage
make clean
make SOC=iMX8MP flash_evk
cp ./iMX8M/flash.bin  /home/lwy/img/genimg/input
cp ./iMX8M/flash.bin  /opt/tftpboot
sync
cd ..