#!/usr/bin/env sh

ENTRYPOINT_COMMAND=php
NO_CMD=1
PHP_OPTIONS=

# Check for binary if first arg doesn't starts with `-`
if [ "${1}" != "" -a "${1:0:1}" != "-" ]; then
    which $1 > /dev/null
    NO_CMD=$?
fi

if [ "1" == "${XDEBUG_ENABLE}" ]; then
    PHP_OPTIONS="${PHP_OPTIONS} -d zend_extension=$(php-config --extension-dir)/xdebug.so"
fi

# Run given command if the first arg matches the entry point command
if [ "$1" = "${ENTRYPOINT_COMMAND}" ]; then
  shift
  set -- ${ENTRYPOINT_COMMAND} ${PHP_OPTIONS} "$@"
# Pass all arguments to the entry point command
elif [ ${NO_CMD} -eq 1 ]; then
  set -- ${ENTRYPOINT_COMMAND} ${PHP_OPTIONS} "$@"
fi

# Run the command
exec "$@"
