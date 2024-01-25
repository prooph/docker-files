CPUS:=$(shell grep -c ^processor /proc/cpuinfo)
MAKEFLAGS += --jobs=$(CPUS)

LIST:=  $(sort $(wildcard m4/*.m4))
dir:=./
EXCLUDE_LIST:= %-xdebug.m4 %-opcache.m4 %-blackfire.m4

dockerfiles:
	for i in $(LIST); do \
		m4 -I $(dir)/inc $(dir)"$$i" | awk 'NF' > `echo $${i##*/} | sed "s/.m4//"` ; \
	done

docker-build:
	export PHP_VERSION=8.0; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.1; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.2; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose build

	export PHP_VERSION=8.0; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.1; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.2; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose build

	export PHP_VERSION=8.0; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.1; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose build
	export PHP_VERSION=8.2; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose build

docker-push:
	export PHP_VERSION=8.0; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.1; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.2; export PHP_TARGET=cli; export DOCKER_REGISTRY=prooph/; docker-compose push

	export PHP_VERSION=8.0; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.1; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.2; export PHP_TARGET=fpm; export DOCKER_REGISTRY=prooph/; docker-compose push

	export PHP_VERSION=8.0; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.1; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose push
	export PHP_VERSION=8.2; export PHP_TARGET=zts; export DOCKER_REGISTRY=prooph/; docker-compose push

docker-pull:
	docker pull php:8.0-cli-alpine3.16
	docker pull php:8.1-cli-alpine3.16
	docker pull php:8.2-cli-alpine3.16
	docker pull php:8.0-fpm-alpine3.16
	docker pull php:8.1-fpm-alpine3.16
	docker pull php:8.2-fpm-alpine3.16
	docker pull php:8.0-zts-alpine3.16
	docker pull php:8.1-zts-alpine3.16
	docker pull php:8.2-zts-alpine3.16
