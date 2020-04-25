
FROM php:7.4-fpm

label Maintainer "Vinicius Espindola"

RUN apt update
RUN apt install -y libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    libzip-dev 


#install lib mongo
RUN pecl install mongodb
RUN pecl install  mcrypt


RUN docker-php-ext-enable mcrypt 
RUN docker-php-ext-install bcmath
RUN docker-php-ext-enable bcmath


RUN docker-php-ext-install xml
RUN docker-php-ext-enable xml


RUN docker-php-ext-install json
RUN docker-php-ext-enable json

#RUN docker-php-ext-install  openssl
#RUN docker-php-ext-enable openssl

RUN docker-php-ext-install  zip
RUN docker-php-ext-enable  zip

# enable mbstring
RUN docker-php-ext-install  mbstring
RUN docker-php-ext-enable mbstring


#libs redis
RUN pecl install igbinary
RUN pecl install redis
RUN docker-php-ext-enable igbinary
RUN docker-php-ext-enable redis


#enable mongodb
RUN docker-php-ext-enable mongodb

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer


#PDO 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

EXPOSE 9002
CMD ["php-fpm"]