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
	for i in $(filter-out $(EXCLUDE_LIST), $(LIST)); do \
		docker build -q -t prooph/php:`echo $${i##*/} | sed "s/.m4//"` -f `echo $${i##*/} | sed "s/.m4//"` . ;\
		echo "finished: $${i##*/}" ;\
	done
	for i in $(filter $(EXCLUDE_LIST), $(LIST)); do \
		docker build -q -t prooph/php:`echo $${i##*/} | sed "s/.m4//"` -f `echo $${i##*/} | sed "s/.m4//"` . ;\
		echo "finished: $${i##*/}" ;\
	done

docker-build-one:
	docker build -t prooph/php:`echo $${image##*/} | sed "s/.m4//"` -f `echo $${image##*/} | sed "s/.m4//"` . ;\

docker-push:
	for i in $(filter %.m4,$(LIST)); do \
		docker push prooph/php:`echo $${i##*/} | sed "s/.m4//"` ;\
	done

docker-pull:
	docker pull php:7.0-cli-alpine3.7
	docker pull php:7.1-cli-alpine3.7
	docker pull php:7.2-cli-alpine3.7
	docker pull php:7.0-fpm-alpine3.7
	docker pull php:7.1-fpm-alpine3.7
	docker pull php:7.2-fpm-alpine3.7
	docker pull php:7.0-zts-alpine3.7
	docker pull php:7.1-zts-alpine3.7
	docker pull php:7.2-zts-alpine3.7