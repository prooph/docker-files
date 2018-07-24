CPUS:=$(shell grep -c ^processor /proc/cpuinfo)
MAKEFLAGS += --jobs=$(CPUS)

LIST:=  $(wildcard m4/*.m4)
dir:=./

dockerfiles:
	for i in $(LIST); do \
		m4 -I $(dir)/inc $(dir)"$$i" | awk 'NF' > `echo $${i##*/} | sed "s/.m4//"` ; \
	done

docker-build:
	for i in $(filter %.m4,$(LIST)); do \
		docker build -q -t prooph/composer:`echo $${i##*/} | sed "s/-cli.m4//"` -f `echo $${i##*/} | sed "s/.m4//"` . ;\
	done

docker-build-one:
	docker build -t prooph/composer:`echo $${image##*/} | sed "s/-cli.m4//"` -f `echo $${image##*/} | sed "s/.m4//"` . ;\

docker-push:
	for i in $(filter %.m4,$(LIST)); do \
		docker push prooph/composer:`echo $${i##*/} | sed "s/-cli.m4//"` ;\
	done
