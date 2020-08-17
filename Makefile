NAME=lamp
VERSION=1.0
#USER=takara
#attach_cmd=su - $(USER)
DOCKER_RUN_OPTIONS= \
    -it \
	-v `pwd`/mysql:/var/lib/mysql \
    --privileged

include docker.mk
