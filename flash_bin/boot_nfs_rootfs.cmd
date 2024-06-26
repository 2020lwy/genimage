setenv bootargs 'console=ttymxc1,115200 nfsvers=3 root=/dev/nfs nfsroot=10.10.68.23:/home/lwy/img/rootfs rw ip=10.10.68.26:10.10.68.23:10.10.68.1:255.255.254.0::eth0:off'
fatload mmc 1:1 0x43000000 imx8mp-evk.dtb
fatload mmc 1:1 0x40400000 Image
booti 0x40400000 - 0x43000000