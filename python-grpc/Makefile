.PHONY: build push pull

VERSION?=v0.1
TAG?=ecosiadev/python-grpc

build:
	docker build -t ${TAG}:${VERSION} ./

push:
	docker push ${TAG}:${VERSION}

latest:
	docker build -t ${TAG}:latest ./
	docker push ${TAG}:latest

pull:
	docker pull ${TAG}:latest