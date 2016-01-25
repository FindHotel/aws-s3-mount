#!/bin/bash

yas3fs s3://$S3_PATH /mnt

tail -f /var/log/syslog
