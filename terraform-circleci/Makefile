.PHONY: build push pull

VERSION?=0.1

build:
	docker build -t ecosiadev/terraform-circleci:${VERSION} ./

push:
	docker push ecosiadev/terraform-circleci:${VERSION}

latest:
	docker build -t ecosiadev/terraform-circleci:latest ./
	docker push ecosiadev/terraform-circleci:latest

pull:
	docker pull ecosiadev/terraform-circleci:latest
