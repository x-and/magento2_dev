FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade

RUN apt-get install -y tzdata software-properties-common
RUN cp /usr/share/zoneinfo/Europe/Simferopol /etc/localtime && echo "Europe/Simferopol" > /etc/timezone

VOLUME /var/www/html/magento2
VOLUME /var/lib/mysql

# php mariadb nginx cron
RUN apt-get install -y \
	php7.4 \
	php7.4-fpm \
	mariadb-server \
	php-bcmath \
	php-curl \
	php-dom \
	php-gd \
	php-intl \
	php-mbstring \
	php-mysql \
	php-soap \
	php-zip \
	php-mime-type \
	unzip \
	nginx \
	cron \
	curl \
	less \
	nano

# composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
	php composer-setup.php \
	php -r "unlink('composer-setup.php');" && \
	mv composer.phar /usr/local/bin/composer

# elasticsearch
RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
	echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list && \
	apt-get update && \
	apt-get install -y elasticsearch

ADD entrypoint.sh /root
ADD db_init.sql /root

ADD nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/root/entrypoint.sh"]