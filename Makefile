NAME=lamp
VERSION=mysql56
#USER=takara
#attach_cmd=su - $(USER)
DOCKER_RUN_OPTIONS= \
    -it \
	-v mysql:/var/lib/mysql \
    --privileged

include docker.mk
