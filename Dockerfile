# This image is based on alpine 3.4
FROM php:5.5-alpine

LABEL maintainer="frank.giesecke@final-gene.de"

ARG PHPREDIS_VERSION="4.0.1"
ENV XDEBUG_VERSION="2.5.5"

# Install build dependencies
# hadolint ignore=SC2086,DL3018
RUN apk add --no-cache --virtual=.build-deps \
        ${PHPIZE_DEPS} \
        bash \
        gettext-dev \
        icu-dev \
        krb5-dev \
        libpng-dev \
        libxml2-dev \
        libxslt-dev \
        openldap-dev \
        postgresql-dev \
        imap-dev \
        libmcrypt-dev

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
    libjpeg-turbo \
    libpng \
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
