#!/bin/bash

set -ex

vgchange -ay

DEVICE_FS=`blkid -o value -s TYPE ${DEVICE} || echo ""`
if [ "`echo -n $DEVICE_FS`" == "" ] ; then
  # wait for the device to be attached
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  mkfs.ext4 /dev/data/volume1
fi
mkdir -p /data
echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data

mkdir -p /data/mongodb_data
mkdir -p /data/mongodb_logs

yum install -y docker && \
service docker start && \
docker pull yaroslavkostyannikov/terraformedmongodb:v0.7 && \
docker run -td -p 27017:27017 -p 27018:27018 -p 27019:27019 -v /data/mongodb_data:/var/lib/mongodb -v /data/mongodb_logs:/var/log/mongodb yaroslavkostyannikov/terraformedmongodb:v0.7
