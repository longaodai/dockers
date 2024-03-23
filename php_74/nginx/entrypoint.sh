#!/bin/bash
#set -e

# Start PHP-FPM in the background
/usr/sbin/php-fpm -D

# Start Nginx in the foreground
/usr/sbin/nginx -g "daemon off;"
