#!/bin/bash

sleep 10

# start services
service php7.4-fpm start

cd /var/www/html/magento2 &&
	composer install &&
	bin/magento setup:install --cleanup-database --base-url=http://127.0.0.1:8765 --db-host=db:3306 --db-name=magento --db-user=magento --db-password=password --admin-firstname=admin  --admin-lastname=admin  --admin-email=admin@admin.com  --admin-user=admin  --admin-password=admin123  --language=ru_RU  --currency=RUB  --timezone=Europe/Simferopol  --use-rewrites=1  --search-engine=elasticsearch7  --elasticsearch-host=elastic  --elasticsearch-port=9200 &&
		find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + &&
		find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + &&
		chown -R :www-data . &&
		chmod u+x bin/magento &&
	bin/magento cron:install &&

# nginx in foreground
nginx -g 'daemon off;'