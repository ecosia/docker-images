FROM golang:alpine AS gobuilder

RUN apk add --update git

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN go get -u github.com/russellcardullo/terraform-provider-pingdom
RUN git clone https://github.com/kubernetes-sigs/aws-iam-authenticator /tmp/aws-iam-authenticator && \
    cd /tmp/aws-iam-authenticator/cmd/aws-iam-authenticator && \
    go install
RUN go get -u github.com/kardianos/govendor
RUN    go get -u github.com/wercker/stern && \
    cd /go/src/github.com/wercker/stern && \
    govendor sync && \
    go install


FROM alpine

ENV KUBECTL_VERSION 1.11.6

RUN apk add --update \
        git \
        curl \
        wget \
        jq \
        python3

# Kubectl
RUN set -eux && cd /tmp && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl

# Helm
RUN VER="v2.13.1" && \
    curl -L --fail -o /tmp/helm-$VER.tgz https://storage.googleapis.com/kubernetes-helm/helm-$VER-linux-amd64.tar.gz && \
    sudo tar -zx -C /tmp -f /tmp/helm-$VER.tgz && \
    sudo mv /tmp/linux-amd64/helm /usr/local/bin/helm

# aws-cli
RUN pip3 install --user awscli && \
    mv ~/.local/bin/aws /usr/local/bin

# kubectx/kubens
RUN git clone https://github.com/ahmetb/kubectx /tmp/kubectx && \
    cp /tmp/kubectx/kubens /usr/local/bin && chmod +x /usr/local/bin/kubectx && \
    cp /tmp/kubectx/kubens /usr/local/bin && chmod +x /usr/local/bin/kubens

COPY --from=gobuilder /go/bin/* /usr/local/bin