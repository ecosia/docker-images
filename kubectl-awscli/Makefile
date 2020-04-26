.PHONY: build push pull

VERSION?=v1.18.46
TAG?=ecosiadev/awscli-kubectl

build:
	docker build -t ${TAG}:${VERSION} ./

push:
	docker push ${TAG}:${VERSION}

latest:
	docker build -t ${TAG}:latest ./
	docker push ${TAG}:latest

pull:
	docker pull ${TAG}:latest
