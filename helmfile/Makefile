.PHONY: build push pull

VERSION?=1.14.10
TAG?=ecosiadev/helmfile

build:
	docker build -t ${TAG}:${VERSION} ./

push:
	docker push ${TAG}:${VERSION}

latest:
	docker build -t ${TAG}:latest ./
	docker push ${TAG}:latest

pull:
	docker pull ${TAG}:latest
