#!/bin/bash
/usr/bin/fdfs_storaged /etc/fdfs/storage.conf
/usr/local/nginx/sbin/nginx
tail -f /usr/local/nginx/logs/nginx.pid
