FROM golang:1.13-alpine as gobuilder
RUN apk add --update git
RUN go get -u github.com/russellcardullo/terraform-provider-pingdom
RUN git clone https://github.com/louy/terraform-provider-uptimerobot && \
    cd terraform-provider-uptimerobot && \
    go install

FROM hashicorp/terraform:0.12.25 as tf
FROM ecosiadev/kubectl:v1.14.10 as kubectl
FROM ecosiadev/kustomize:v3.5.4 as kustomize
FROM vault:1.0.3 as vault
FROM alpine/helm:2.13.1 as helm

FROM python:alpine3.8
RUN apk add --update \
    jq \
    make \
    sudo \
    git \
    openssh-client \
    g++ \
    bash \
    curl

COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kustomize /usr/bin/kustomize /usr/local/bin/kustomize
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=tf /bin/terraform /usr/local/bin/terraform
COPY --from=gobuilder /go/bin/ /tfproviders/

RUN addgroup -S circleci && adduser --shell /bin/bash -S -G circleci circleci
RUN echo "circleci ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER circleci
WORKDIR /home/circleci

RUN mkdir -p ~/.terraform.d/plugins/linux_amd64 && \
    sudo mv /tfproviders/* ~/.terraform.d/plugins/linux_amd64/ && sudo chown -R circleci:circleci ~/.terraform.d

ENV PATH "/home/circleci/.local/bin:$PATH"
RUN pip3 install --user awscli && pip install --user pipenv
