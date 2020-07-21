.PHONY: build push pull

VERSION?=11.7
TAG?=ecosiadev/rds-postgresql-client

build:
	docker build -t ${TAG}:${VERSION} ./

push:
	docker push ${TAG}:${VERSION}

latest:
	docker build -t ${TAG}:latest ./
	docker push ${TAG}:latest

pull:
	docker pull ${TAG}:latest
