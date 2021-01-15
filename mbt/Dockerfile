FROM golang:1.14.13-alpine3.11

RUN apk upgrade && \
    apk add --update \
    make \
    gcc \
    libc-dev \
    pkgconf \
    git \
    bash \
    jq \
    openssh-client

RUN apk add libgit2-dev==0.28.5-r0
RUN git clone https://github.com/ecosia/mbt
RUN cd mbt && go build && mv mbt /usr/bin

WORKDIR $GOPATH
ENTRYPOINT ["mbt"]
