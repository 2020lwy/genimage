setenv bootargs 'console=ttymxc1,115200 root=/dev/mmcblk1p2 rootwait rw'
fatload mmc 1:1 0x43000000 imx8mp-evk.dtb
fatload mmc 1:1 0x40400000 Image
booti 0x40400000 - 0x43000000