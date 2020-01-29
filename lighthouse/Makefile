.PHONY: build push pull

VERSION?=0.1

build:
	docker build -t ecosiadev/lighthouse:${VERSION} ./

push:
	docker push ecosiadev/lighthouse:${VERSION}

latest:
	docker build -t ecosiadev/lighthouse:latest ./
	docker push ecosiadev/lighthouse:latest

pull:
	docker pull ecosiadev/lighthouse:latest
