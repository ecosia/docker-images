.PHONY: build push pull

VERSION?=0.1

build:
	docker build -t ecosiadev/kubectl-terraform-circleci:${VERSION} ./

push:
	docker push ecosiadev/kubectl-terraform-circleci:${VERSION}

latest:
	docker build -t ecosiadev/kubectl-terraform-circleci:latest ./
	docker push ecosiadev/kubectl-terraform-circleci:latest

pull:
	docker pull ecosiadev/kubectl-terraform-circleci:latest
