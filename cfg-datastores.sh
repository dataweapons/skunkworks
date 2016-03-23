#!/bin/sh

esxcli vsan policy setdefault -c vdisk -p "((\"hostFailuresToTolerate\" i1) (\"forceProvisioning\" i1))"
esxcli vsan policy setdefault -c vmnamespace -p "((\"hostFailuresToTolerate\" i1) (\"forceProvisioning\" i1))"

esxcli vsan network ipv4 add -i vmk0
esxcli vsan cluster new
vdq -q

esxcli vsan storage tag add \
 -s t10.ATA_____Samsung_SSD_850_EVO_500GB_______________S2RANXAH138511D_____ \
 -t capacityFlash

esxcli vsan storage add \
-s t10.ATA_____Samsung_SSD_850_EVO_M.2_250GB___________S24BNXAH105839L_____ \
-d t10.ATA_____Samsung_SSD_850_EVO_500GB_______________S2RANXAH138511D_____
