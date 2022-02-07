#!/bin/bash
[ -d sources ] || git clone https://github.com/magento/magento2.git ./sources

cd docker && docker-compose down && docker-compose build && docker-compose up
