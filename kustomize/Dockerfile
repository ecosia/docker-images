FROM alpine:3.8

ARG VERSION
ENV VERSION=v3.5.4

RUN apk add curl
# Install Kustomize
RUN curl -L >kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${VERSION}/kustomize_${VERSION}_linux_amd64.tar.gz \
 && tar -xzvf kustomize.tar.gz  -C /usr/bin \
 && rm kustomize.tar.gz \
 && chmod +x /usr/bin/kustomize

CMD ["kustomize"]
