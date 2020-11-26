.PHONY: build push pull

VERSION?=0.4.1

build:
	docker build -t ecosiadev/cypress-lighthouse:${VERSION} ./

push:
	docker push ecosiadev/cypress-lighthouse:${VERSION}

latest:
	docker build -t ecosiadev/cypress-lighthouse:latest ./
	docker push ecosiadev/cypress-lighthouse:latest

pull:
	docker pull ecosiadev/cypress-lighthouse:latest
