FROM ecosiadev/kubectl:v1.15.12 as kubectl
FROM ecosiadev/kustomize:v3.5.4 as kustomize
FROM vault:1.0.3 as vault
FROM alpine/helm:2.13.1 as helm

FROM golang:1.15-alpine as build
RUN apk upgrade -U -a && \
          apk upgrade && \
          apk add --update go gcc g++ git ca-certificates curl make && \
          git clone https://github.com/warrensbox/terraform-switcher.git /app
WORKDIR /app
RUN CGO_ENABLED=1 GOOS=linux go build -a .

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

RUN addgroup -S circleci && adduser --shell /bin/bash -S -G circleci circleci
RUN echo "circleci ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER circleci
WORKDIR /home/circleci

ENV PATH "/home/circleci/.local/bin:$PATH"

RUN pip3 install --user awscli && pip install --user pipenv

COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=kustomize /usr/bin/kustomize /usr/local/bin/kustomize
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=build /app/terraform-switcher /usr/local/bin/tfswitch

# tfswitch maintains a symlink for terraform in the /usr/local/bin dir
# because we run tfswitch as the circleci user we change the ownership here for convenience
RUN sudo chown circleci /usr/local/bin
RUN tfswitch 0.12.29
RUN tfswitch 0.13.5

RUN mkdir -p ~/.terraform.d/plugins/linux_amd64
RUN cd /tmp \
    && curl -L https://github.com/russellcardullo/terraform-provider-pingdom/releases/download/v1.1.2/terraform-provider-pingdom_1.1.2_linux_amd64.zip -o pingdom.zip \
    && unzip pingdom.zip \
    && mv terraform-provider-pingdom_v1.1.2 ~/.terraform.d/plugins/linux_amd64/terraform-provider-pingdom \
    && rm /tmp/*
RUN cd /tmp \
    && curl -L https://github.com/louy/terraform-provider-uptimerobot/releases/download/v0.5.1/terraform-provider-uptimerobot_0.5.1_linux_amd64.zip -o uptimerobot.zip \
    && unzip uptimerobot.zip \
    && mv terraform-provider-uptimerobot ~/.terraform.d/plugins/linux_amd64/terraform-provider-uptimerobot \
    && rm /tmp/*
