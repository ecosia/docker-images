.PHONY: build push pull

VERSION?=0.1

build:
	docker build -t ecosiadev/kubectl-circleci:${VERSION} ./

push:
	docker push ecosiadev/kubectl-circleci:${VERSION}

latest:
	docker build -t ecosiadev/kubectl-circleci:latest ./
	docker push ecosiadev/kubectl-circleci:latest

pull:
	docker pull ecosiadev/kubectl-circleci:latest
