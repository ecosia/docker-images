FROM golang:1.16-alpine as gobuilder
RUN apk add --update git
RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

FROM docker:19
COPY --from=gobuilder /go/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login

RUN apk upgrade && \
    apk add --update \
    bash \
    git \
    jq \
    make \
    openssh-client \
    parallel \
    python3 \
    py3-pip \
    sudo

RUN pip3 install --user awscli
ENV PATH="~/.local/bin:${PATH}"
ENV DOCKER_CLI_EXPERIMENTAL="enabled"
