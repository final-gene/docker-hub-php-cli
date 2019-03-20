#!/usr/bin/env sh

ENTRYPOINT_COMMAND=php
NO_CMD=1
PHP_OPTIONS=

# Check for binary if first arg doesn't starts with `-`
if [[ "${1}" != "" && "${1:0:1}" != "-" ]]; then
    which $1 > /dev/null
    NO_CMD=$?
fi

# Enable or disable XDEBUG
if [[ "1" = "${XDEBUG_ENABLE}" ]]; then
    echo "zend_extension=xdebug.so" > ${PHP_INI_DIR}/conf.d/docker-php-ext-xdebug.ini
else
    rm -f ${PHP_INI_DIR}/conf.d/docker-php-ext-xdebug.ini
fi

# Run given command if the first arg matches the entry point command
if [[ "$1" = "${ENTRYPOINT_COMMAND}" ]]; then
  shift
  set -- ${ENTRYPOINT_COMMAND} "$@"
# Pass all arguments to the entry point command
elif [[ ${NO_CMD} -eq 1 ]]; then
  set -- ${ENTRYPOINT_COMMAND} "$@"
fi

# Run the command
exec "$@"
