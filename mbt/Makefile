.PHONY: build push pull

VERSION?=0.4

build:
	docker build -t ecosiadev/mbt:${VERSION} ./

push:
	docker push ecosiadev/mbt:${VERSION}

latest:
	docker build -t ecosiadev/mbt:latest ./
	docker push ecosiadev/mbt:latest

pull:
	docker pull ecosiadev/mbt:latest
