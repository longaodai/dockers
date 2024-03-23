FROM centos:centos7

MAINTAINER LONGAODAI

# copy source app
COPY . /var/www/app

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm

# normal updates
#RUN yum -y update

# install php 7.3
RUN yum -y install php74 php74-fpm php74-php php74-php-opcache php74-php-bcmath php74-php-cli php74-php-common php74-php-gd php74-php-intl php74-php-json php74-php-mbstring php74-php-pdo php74-php-pdo-dblib php74-php-pear php74-php-pecl-mcrypt php74-php-xmlrpc php74-php-xml php74-php-mysql php74-php-soap php74-php-pecl-zip php74-php-pecl-mongodb php74-php-pecl-xdebug php74-php-pecl-yaml php74-php-redis

# install nginx
RUN yum -y install nginx openssl php-fpm

# tools
RUN yum -y install epel-release iproute at curl crontabs git

# pagespeed
RUN yum clean all \
 && php74 -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php74 composer-setup.php --install-dir=bin --filename=composer --version=1.4.3 \
 && php74 -r "unlink('composer-setup.php');" \
 && rm -rf /etc/localtime \
 && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
 && ln -s /bin/php74 /bin/php

EXPOSE 80

WORKDIR /var/www/app

ADD conf.d/default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
