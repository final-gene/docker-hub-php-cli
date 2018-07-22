# PHP CLI
[![CircleCI](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master.svg?style=svg)](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/e067ba9a720d4b3995c21adc9182f599)](https://www.codacy.com/app/final-gene/docker-hub-php-cli?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=final-gene/docker-hub-php-cli&amp;utm_campaign=Badge_Grade)

This is a image to run the [PHP CLI](http://php.net/manual/en/features.commandline.php).

## Supported tags and respective Dockerfile links
* `7.2`, `7.2-xdebug`, `latest` [(7.2/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.2/Dockerfile)

## How to use this image
Run the `php-cli` image:

```bash
docker run \
    --rm \
    --tty \
    --interactive \
    --volume "$(pwd)":/app \
    finalgene/php-cli
```

Run the `php-cli` image with `XDEBUG` enabled:

```bash
docker run \
    --rm \
    --tty \
    --interactive \
    --env XDEBUG_ENABLE=1
    --volume "$(pwd)":/app \
    finalgene/php-cli
```

For further information take a look at the [official PHP documentation](http://php.net/manual/en/).

## Supported PHP Extensions

| PHP Version /<br>Extension | 7.2<br>. |
| -------------------------- |:--------:|
| bcmath                     |    x     |
| calendar                   |    x     |
| exif                       |    x     |
| gd                         |    x     |
| gettext                    |    x     |
| imap                       |    x     |
| intl                       |    x     |
| ldap                       |    x     |
| mysqli                     |    x     |
| opcache                    |    x     |
| pcntl                      |    x     |
| pdo_mysql                  |    x     |
| pdo_pgsql                  |    x     |
| redis                      |    x     |
| shmop                      |    x     |
| soap                       |    x     |
| sockets                    |    x     |
| sysvmsg                    |    x     |
| sysvsem                    |    x     |
| sysvshm                    |    x     |
| wddx                       |    x     |
| [xdebug](#footnote-xdebug) |    x     |
| xsl                        |    x     |
| zip                        |    x     |

**<a name="footnote-xdebug">XDEBUG</a>** is installed but not activated by default. When using `XDEBUG` set the environment `XDEBUG_ENABLE=1` or add `-d zend_extension=xdebug.so` as option to you command.

## Quick reference
* **Where to get help:**
[the Docker Community Forums](https://forums.docker.com), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

* **Where to file issues:**
https://github.com/finalgene/docker-hub-php-cli/issues

* **Maintained by:**
[The final gene Team](https://github.com/finalgene)

* **Source of this description:**
[Repository README.md](https://github.com/finalgene/docker-hub-php-cli/blob/master/README.md)
