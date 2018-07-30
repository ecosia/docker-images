FROM alpine:3.8

ENV KUBECTL_VERSION="v1.9.6"

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ moreutils \
    && apk add --no-cache ca-certificates jq \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
