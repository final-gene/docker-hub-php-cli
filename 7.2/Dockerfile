FROM php:7.2-cli-alpine3.7

LABEL maintainer="frank.giesecke@final-gene.de"

ENV PHPREDIS_VERSION "4.0.1"
ENV XDEBUG_VERSION "2.6.0"

# Install build dependencies
# hadolint ignore=SC2086
RUN apk add --no-cache --virtual=.build-deps \
        ${PHPIZE_DEPS} \
        bash=4.4.19-r1 \
        gettext-dev=0.19.8.1-r1 \
        icu-dev=59.1-r1 \
        krb5-dev=1.15.2-r1 \
        libpng-dev=1.6.34-r1 \
        libressl-dev=2.6.5-r0 \
        libxml2-dev=2.9.7-r0 \
        libxslt-dev=1.1.31-r0 \
        openldap-dev=2.4.45-r3 \
        postgresql-dev=10.4-r0 \
        libzip=1.3.0-r1 \
        imap-dev=2007f-r7

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-c"]

# Provide sources to build PHP redis client
RUN mkdir -p /usr/src/php/ext/redis \
    && curl -sSL "https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz" | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts

# Configure and install PHP extensions
RUN docker-php-ext-configure \
        imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        bcmath \
        calendar \
        exif \
        gd \
        gettext \
        imap \
        intl \
        ldap \
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
    libjpeg-turbo=1.5.2-r0 \
    libpng=1.6.34-r1 \
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
