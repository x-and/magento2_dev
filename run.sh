#!/bin/bash
$PWD = pwd
[ -d sources ] || git clone https://github.com/magento/magento2.git ./sources
[ -d mysql ] || mkdir mysql

docker build -f docker/Dockerfile ./docker -t magento2 &&
docker rm -f magento2_dev &&
docker run --name=magento2_dev -d -t -v $PWD/sources:/var/www/html/magento2 -v $PWD/mysql:/var/lib/mysql -p 8765:8765 magento2
