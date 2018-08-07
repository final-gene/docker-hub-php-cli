FROM php:5.3-cli

LABEL maintainer="frank.giesecke@final-gene.de"

ENV XDEBUG_VERSION "2.2.7"

SHELL ["/bin/bash", "-o", "pipefail", "-e", "-c"]

# Install XDEBUG
RUN pecl install "xdebug-${XDEBUG_VERSION}"

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
