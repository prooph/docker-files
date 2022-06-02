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
	PHP_VERSION=7.4; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.0; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.1; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose build

	PHP_VERSION=7.4; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.0; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.1; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose build

	PHP_VERSION=7.4; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.0; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose build
	PHP_VERSION=8.1; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose build

docker-push:
	PHP_VERSION=7.4; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.0; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.1; PHP_TARGET=cli; DOCKER_REGISTRY=prooph/; docker-compose push

	PHP_VERSION=7.4; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.0; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.1; PHP_TARGET=fpm; DOCKER_REGISTRY=prooph/; docker-compose push

	PHP_VERSION=7.4; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.0; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose push
	PHP_VERSION=8.1; PHP_TARGET=zts; DOCKER_REGISTRY=prooph/; docker-compose push

docker-pull:
	docker pull php:7.4-cli-alpine3.15
	docker pull php:8.0-cli-alpine3.15
	docker pull php:8.1-cli-alpine3.15
	docker pull php:7.4-fpm-alpine3.15
	docker pull php:8.0-fpm-alpine3.15
	docker pull php:8.1-fpm-alpine3.15
	docker pull php:7.4-zts-alpine3.15
	docker pull php:8.0-zts-alpine3.15
	docker pull php:8.1-zts-alpine3.15
