FROM php:5.3-cli

LABEL maintainer="frank.giesecke@final-gene.de"

ENV XDEBUG_VERSION="2.2.7"
ENV DEBIAN_FRONTEND "noninteractive"

# Install build dependencies
# hadolint ignore=DL3008,SC2086
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
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
    && ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && apt-get clean -yqq \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apk/*s

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-c"]

# Install XDEBUG
RUN pecl install "xdebug-${XDEBUG_VERSION}"

# Remove build dependencies
RUN apt-get remove --purge -yqq \
    && apt-get --purge autoremove -yqq

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
