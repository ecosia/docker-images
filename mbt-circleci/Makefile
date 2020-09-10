.PHONY: build push pull

VERSION?=0.3

build:
	docker build -t ecosiadev/mbt-circleci:${VERSION} ./

push:
	docker push ecosiadev/mbt-circleci:${VERSION}

latest:
	docker build -t ecosiadev/mbt-circleci:latest ./
	docker push ecosiadev/mbt-circleci:latest

pull:
	docker pull ecosiadev/mbt-circleci:latest
