.PHONY: build push pull

VERSION?=3.7.1

build:
	docker build -t ecosiadev/cypress-base:${VERSION} ./

push:
	docker push ecosiadev/cypress-base:${VERSION}

latest:
	docker build -t ecosiadev/cypress-base:latest ./
	docker push ecosiadev/cypress-base:latest

pull:
	docker pull ecosiadev/cypress-base:latest
