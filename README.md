# PHP CLI
[![CircleCI](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master.svg?style=svg)](https://circleci.com/gh/final-gene/docker-hub-php-cli/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/e067ba9a720d4b3995c21adc9182f599)](https://www.codacy.com/app/final-gene/docker-hub-php-cli?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=final-gene/docker-hub-php-cli&amp;utm_campaign=Badge_Grade)

This is a image to run the [PHP CLI](http://php.net/manual/en/features.commandline.php).

## Supported tags and respective Dockerfile links
* `7.2`, `7.2-xdebug`, `latest` [(7.2/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.2/Dockerfile)
* `7.1`, `7.1-xdebug` [(7.1/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.1/Dockerfile)
* `7.0`, `7.0-xdebug` [(7.0/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/7.0/Dockerfile)
* `5.6`, `5.6-xdebug` [(5.6/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/5.6/Dockerfile)
* `5.5`, `5.5-xdebug` [(5.5/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/5.5/Dockerfile)
* `5.4`, `5.4-xdebug` [(5.4/Dockerfile)](https://github.com/finalgene/docker-hub-php-cli/blob/master/5.4/Dockerfile)

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

| PHP Version /<br>Extension | 5.4<br>. | 5.5<br>. | 5.6<br>. | 7.0<br>. | 7.1<br>. | 7.2<br>. |
| -------------------------- |:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| bcmath                     |    x     |    x     |    x     |    x     |    x     |    x     |
| calendar                   |    x     |    x     |    x     |    x     |    x     |    x     |
| exif                       |    x     |    x     |    x     |    x     |    x     |    x     |
| gd                         |    x     |    x     |    x     |    x     |    x     |    x     |
| gettext                    |    x     |    x     |    x     |    x     |    x     |    x     |
| imap                       |    x     |    x     |    x     |    x     |    x     |    x     |
| intl                       |    x     |    x     |    x     |    x     |    x     |    x     |
| ldap                       |    x     |    x     |    x     |    x     |    x     |    x     |
| mcrypt                     |    x     |    x     |    x     |    x     |    x     |          |
| mysqli                     |    x     |    x     |    x     |    x     |    x     |    x     |
| opcache                    |          |    x     |    x     |    x     |    x     |    x     |
| pcntl                      |    x     |    x     |    x     |    x     |    x     |    x     |
| pdo_mysql                  |    x     |    x     |    x     |    x     |    x     |    x     |
| pdo_pgsql                  |    x     |    x     |    x     |    x     |    x     |    x     |
| redis                      |    x     |    x     |    x     |    x     |    x     |    x     |
| shmop                      |    x     |    x     |    x     |    x     |    x     |    x     |
| soap                       |    x     |    x     |    x     |    x     |    x     |    x     |
| sockets                    |    x     |    x     |    x     |    x     |    x     |    x     |
| sysvmsg                    |    x     |    x     |    x     |    x     |    x     |    x     |
| sysvsem                    |    x     |    x     |    x     |    x     |    x     |    x     |
| sysvshm                    |    x     |    x     |    x     |    x     |    x     |    x     |
| wddx                       |    x     |    x     |    x     |    x     |    x     |    x     |
| [xdebug](#footnote-xdebug) |    x     |    x     |    x     |    x     |    x     |    x     |
| xsl                        |    x     |    x     |    x     |    x     |    x     |    x     |
| zip                        |    x     |    x     |    x     |    x     |    x     |    x     |

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
