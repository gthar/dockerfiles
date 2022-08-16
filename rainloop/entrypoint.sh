#!/bin/sh

echo "starting daemonized nginx"
nginx

echo "starting php-fpm"
php-fpm
