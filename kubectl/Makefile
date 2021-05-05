.PHONY: build push pull

VERSION?=v1.17.17
TAG?=ecosiadev/kubectl

build:
	docker build -t ${TAG}:${VERSION} ./

push:
	docker push ${TAG}:${VERSION}

latest:
	docker build -t ${TAG}:latest ./
	docker push ${TAG}:latest

pull:
	docker pull ${TAG}:latest
