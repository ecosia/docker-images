.PHONY: build push pull

VERSION?=0.10
TAG?=kubectl-terraform-circleci

build:
	docker build -t ecosiadev/${TAG}:${VERSION} ./

push:
	docker push ecosiadev/${TAG}:${VERSION}

latest:
	docker build -t ecosiadev/${TAG}:latest ./
	docker push ecosiadev/${TAG}:latest

pull:
	docker pull ecosiadev/${TAG}:latest
