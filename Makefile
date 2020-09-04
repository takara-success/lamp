NAME=takarasuccess/lamp
CONTAINER_NAME=lamp
VERSION=latest
#USER=takara
#attach_cmd=su - $(USER)
DOCKER_RUN_OPTIONS= \
    -it \
	-v `pwd`/mysql:/var/lib/mysql \
    --privileged

include docker.mk
