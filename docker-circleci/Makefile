.PHONY: build push pull

VERSION?=0.2

build:
	docker build -t ecosiadev/docker-circleci:${VERSION} ./

push:
	docker push ecosiadev/docker-circleci:${VERSION}

latest:
	docker build -t ecosiadev/docker-circleci:latest ./
	docker push ecosiadev/docker-circleci:latest

pull:
	docker pull ecosiadev/docker-circleci:latest
