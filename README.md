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

For further information take a look at the [official PHP documentation](http://php.net/manual/en/).

## Quick reference
* **Where to get help:**
[the Docker Community Forums](https://forums.docker.com), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

* **Where to file issues:**
https://github.com/finalgene/docker-hub-php-cli/issues

* **Maintained by:**
[The final gene Team](https://github.com/finalgene)

* **Source of this description:**
[Repository README.md](https://github.com/finalgene/docker-hub-php-cli/blob/master/README.md)
