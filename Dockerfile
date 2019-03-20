FROM php:5.4-cli

LABEL maintainer="frank.giesecke@final-gene.de"

ARG PHPREDIS_VERSION="4.0.1"
ENV XDEBUG_VERSION="2.4.1"

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-c"]

# Install build dependencies
# hadolint ignore=DL3008,SC2086
RUN apt-get update -qq; \
    apt-get install --yes --no-install-recommends \
        ${PHPIZE_DEPS} \
        libpng-dev \
        libc-client-dev \
        libkrb5-dev \
        zlib1g-dev \
        libicu-dev \
        libldap2-dev \
        libpq-dev \
        libxml2-dev \
        libxml2-dev \
        libxslt1-dev \
        libzip-dev \
        libmcrypt-dev \
    ; \
    ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so; \
    apt-get clean --yes -qq; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apk/*s

# Provide sources to build PHP redis client
RUN mkdir -p /usr/src/php/ext/redis; \
    curl -sSL "https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz" | tar xvz -C /usr/src/php/ext/redis --strip 1; \
    echo 'redis' >> /usr/src/php-available-exts

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

# Remove build dependencies
RUN apt-get autoremove --purge --yes -qq

# Change the default shell
WORKDIR /bin
RUN rm sh \
    && ln -s bash sh

# Add entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Configure working directory
WORKDIR /app

# Configure entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
