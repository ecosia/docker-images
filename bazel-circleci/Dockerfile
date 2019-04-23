FROM golang:1.10-stretch as intermediate

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

FROM python:3.6.6-slim-stretch

# make Apt non-interactive
RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90circleci \
  && echo 'DPkg::Options "--force-confnew";' >> /etc/apt/apt.conf.d/90circleci

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHON_PIP_VERSION 18.0
ENV BAZEL_VERSION 0.24.1
ENV KUBECTL_VERSION 1.11.6

RUN apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        gnupg \
        gzip \
        jq \
        openssh-client \
        python \
        sudo \
        tar \
        pkg-config \
        zip \
        g++ \
        zlib1g-dev \
        unzip \
        xz-utils \
        patch \
        procps \
        wget \
        # Dependencies for Cypress framework
        xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 \
    && \
    sudo rm -rf /var/lib/apt/lists/*

# setup circleci user. Taken from the circle ci docker images.
RUN groupadd --gid 3434 circleci \
  && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
  && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
  && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep
USER circleci
WORKDIR /home/circleci

COPY --from=intermediate /go/bin/docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login

# Add bazel-remote-proxy
RUN curl --fail -o ~/bazel-remote-proxy "https://6-116431813-gh.circle-artifacts.com/0/pkg/bazel-remote-proxy-$(uname -s)_$(uname -m)" && \
    chmod +x ~/bazel-remote-proxy

# setup python and pip
RUN sudo ln -sf /usr/bin/python2 /usr/local/bin/python
RUN curl --fail -o /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py' && \
    sudo python3 /tmp/get-pip.py "pip==$PYTHON_PIP_VERSION" && \
    sudo python /tmp/get-pip.py "pip==$PYTHON_PIP_VERSION" && \
    rm /tmp/get-pip.py

# install kubectl
RUN set -eux && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    sudo mv ./kubectl /usr/local/bin/kubectl

# Install bazel
RUN set -eux && \
    curl -L --fail -o /tmp/bazel-installer.sh https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    chmod +x /tmp/bazel-installer.sh  && \
    sudo /tmp/bazel-installer.sh && \
    rm /tmp/bazel-installer.sh
RUN bazel version

# Install docker
RUN VER="17.03.0-ce" && \
    curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz && \
    sudo tar -xz -C /tmp -f /tmp/docker-$VER.tgz && \
    sudo mv /tmp/docker/* /usr/bin

# Install helm
RUN VER="v2.13.1" && \
    curl -L --fail -o /tmp/helm-$VER.tgz https://storage.googleapis.com/kubernetes-helm/helm-$VER-linux-amd64.tar.gz && \
    sudo tar -zx -C /tmp -f /tmp/helm-$VER.tgz && \
    sudo mv /tmp/linux-amd64/helm /usr/local/bin/helm

# Install aws cli
RUN sudo pip3 install awscli --upgrade

RUN curl -L --fail -o /tmp/vault.zip https://releases.hashicorp.com/vault/1.0.3/vault_1.0.3_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /tmp/vault && \
    sudo mv /tmp/vault/vault /usr/local/bin
