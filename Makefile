# Project Makefile
include container.conf
export $(shell sed 's/=.*//' container.conf)

.PHONY: build update run all clean

all: build

build:
	docker build -t ${dockerUser}/${finalImageName}:${finalImageVersion} --build-arg IMAGE_USER=${dockerUser} --build-arg IMAGE_NAME=${buildImageName} --build-arg IMAGE_VERSION=${buildImageVersion} .
	docker tag ${dockerUser}/${finalImageName}:${finalImageVersion} ${dockerUser}/${finalImageName}:latest

run:
	$(call colors)
	@echo -e Starting Container...
	@docker run -it --rm --name kubectl ${dockerUser}/${finalImageName}:${finalImageVersion} "$@"
	@echo -e Container Stopped

clean:
	docker rmi -f ${dockerUser}/${finalImageName}:latest
	docker rmi -f ${dockerUser}/${finalImageName}:${finalImageVersion}
