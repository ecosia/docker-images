FROM golang:1.13-alpine as intermediate

RUN apk add --update git

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN go get -u github.com/russellcardullo/terraform-provider-pingdom

FROM hashicorp/terraform:0.12.9 as tf
FROM ecosiadev/kubectl:v1.12.0 as kubectl
FROM vault:1.0.3 as vault
FROM alpine/helm:2.13.1 as helm
FROM ecosiadev/mbt:0.1 AS mbt

FROM python:alpine3.8
COPY --from=intermediate /go/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
RUN apk add --update \
    jq \
    make \
    curl \
    wget \
    sudo \
    docker \
    git \
    openssh-client \
    tar \
    gzip \
    ca-certificates \
    bash \
    g++ \
    parallel

RUN apk add libgit2-dev==0.27.3-r0

# Install aws cli
RUN pip3 install awscli --upgrade && pip install --user pipenv

COPY --from=tf /bin/terraform /usr/local/bin/terraform
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=mbt /go/bin/mbt /usr/local/bin/mbt
COPY --from=intermediate /go/bin/terraform-provider-pingdom /terraform-provider-pingdom

RUN addgroup -S circleci && adduser --shell /bin/bash -S -G circleci circleci
RUN echo "circleci ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER circleci
WORKDIR /home/circleci

RUN mkdir -p ~/.terraform.d/plugins/linux_amd64 && \
    sudo mv /terraform-provider-pingdom ~/.terraform.d/plugins/linux_amd64/terraform-provider-pingdom_v$(date +%Y.%m.%d) && sudo chown -R circleci:circleci ~/.terraform.d

