# PHP CLI
[![CircleCI](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master.svg?style=svg)](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/e067ba9a720d4b3995c21adc9182f599)](https://www.codacy.com/app/final-gene/docker-hub-php-cli?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=final-gene/docker-hub-php-cli&amp;utm_campaign=Badge_Grade)

This is a image to run the [PHP CLI](http://php.net/manual/en/features.commandline.php).

## Supported tags and respective Dockerfile links
* `7.2`, `7.2-xdebug`, `latest` [(7.2/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.2/Dockerfile)
* `7.1`, `7.1-xdebug` [(7.1/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.1/Dockerfile)

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

| PHP Version /<br>Extension | 7.1<br>. | 7.2<br>. |
| -------------------------- |:--------:|:--------:|
| bcmath                     |    x     |    x     |
| calendar                   |    x     |    x     |
| exif                       |    x     |    x     |
| gd                         |    x     |    x     |
| gettext                    |    x     |    x     |
| imap                       |    x     |    x     |
| intl                       |    x     |    x     |
| ldap                       |    x     |    x     |
| mcrypt                     |    x     |          |
| mysqli                     |    x     |    x     |
| opcache                    |    x     |    x     |
| pcntl                      |    x     |    x     |
| pdo_mysql                  |    x     |    x     |
| pdo_pgsql                  |    x     |    x     |
| redis                      |    x     |    x     |
| shmop                      |    x     |    x     |
| soap                       |    x     |    x     |
| sockets                    |    x     |    x     |
| sysvmsg                    |    x     |    x     |
| sysvsem                    |    x     |    x     |
| sysvshm                    |    x     |    x     |
| wddx                       |    x     |    x     |
| [xdebug](#footnote-xdebug) |    x     |    x     |
| xsl                        |    x     |    x     |
| zip                        |    x     |    x     |

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
