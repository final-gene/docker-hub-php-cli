NAME = php-cli

VERSIONS = 5.4 5.5 5.6 7.0 7.1 7.2

.PHONY: build
build: ${VERSIONS}

.PHONY: ${VERSIONS}
${VERSIONS}:
	@echo "Build ${@}"

	@docker run \
		--rm \
		--volume "$(shell pwd)":/app \
		finalgene/hadolint \
		${@}/Dockerfile

	@docker build \
		--no-cache \
		--tag finalgene/${NAME}:${@}-dev \
		${@}/

	@docker images finalgene/${NAME}:${@}-dev

.PHONY: clean
clean:
	-@docker rmi \
		--force \
		$(shell docker images finalgene/${NAME}:*-dev -q)
