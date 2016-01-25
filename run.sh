#!/bin/bash

mkdir -p /mnt/$S3_PATH
yas3fs s3://$S3_PATH /mnt/$S3_PATH

tail -f /var/log/syslog
