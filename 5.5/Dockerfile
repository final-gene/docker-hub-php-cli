# This image is based on alpine 3.4
FROM php:5.5-alpine

LABEL maintainer="frank.giesecke@final-gene.de"

ENV PHPREDIS_VERSION="4.0.1"
ENV XDEBUG_VERSION="2.5.5"

# Install build dependencies
# hadolint ignore=SC2086
RUN apk add --no-cache --virtual=.build-deps \
        ${PHPIZE_DEPS} \
        bash=4.3.42-r5 \
        gettext-dev=0.19.7-r3 \
        icu-dev=57.1-r3 \
        krb5-dev=1.14.3-r0 \
        libpng-dev=1.6.21-r0 \
        libxml2-dev=2.9.5-r0 \
        libxslt-dev=1.1.29-r1 \
        openldap-dev=2.4.44-r2 \
        postgresql-dev=9.5.12-r0 \
        imap-dev=2007f-r2 \
        libmcrypt-dev=2.5.8-r7

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-c"]

# Provide sources to build PHP redis client
RUN mkdir -p /usr/src/php/ext/redis \
    && curl -sSL "https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz" | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts

# Configure and install PHP extensions
RUN docker-php-ext-configure \
        imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure ldap \
    && docker-php-ext-install \
        bcmath \
        calendar \
        exif \
        gd \
        gettext \
        imap \
        intl \
        ldap \
        mcrypt \
        mysqli \
        opcache \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        redis \
        shmop \
        soap \
        sockets \
        sysvmsg \
        sysvsem \
        sysvshm \
        wddx \
        xsl \
        zip

# Install XDEBUG
RUN pecl install "xdebug-${XDEBUG_VERSION}"

# Install persistent dependencies
# hadolint ignore=SC2046,DL3018
RUN apk add --no-cache --virtual .persistent-deps \
    libjpeg-turbo=1.4.2-r0 \
    libpng=1.6.21-r0 \
    $( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
        | tr ',' '\n' \
        | sort -u \
        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )

# Remove build dependencies
RUN apk del .build-deps

# Add entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Configure working directory
WORKDIR /app

# Configure entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
