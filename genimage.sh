#!/usr/bin/env bash
sudo rm *.img
cp ../buildroot/output/images/rootfs.ext2  ./input
sudo ./bin --rootpath /home/lwy/img/buildroot/output/target --tmppath ./tmp --inputpath ./input  --outputpath ./ --config ./genimage.cfg
cp *.img /mnt/hgfs/Share
sync
