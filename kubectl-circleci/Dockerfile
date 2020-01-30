FROM ecosiadev/kubectl:v1.11.6 as kubectl
FROM vault:1.0.3 as vault
FROM alpine/helm:2.13.1 as helm

FROM python:alpine3.8
RUN apk add --update \
    jq \
    make \
    sudo \
    git \
    openssh-client \
    bash

# Install aws cli
RUN pip3 install --user awscli && pip install --user pipenv
ENV PATH="~/.local/bin:${PATH}"


COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
 
RUN addgroup -S circleci && adduser --shell /bin/bash -S -G circleci circleci
RUN echo "circleci ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER circleci
WORKDIR /home/circleci

