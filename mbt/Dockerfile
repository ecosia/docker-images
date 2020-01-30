FROM golang:1.10-alpine3.8

RUN apk upgrade && \
    apk add --update \
    cmake \
    gcc \
    libc-dev \
    pkgconf \
    git

RUN apk add libgit2-dev==0.27.3-r0
RUN go get -u github.com/mbtproject/mbt

WORKDIR $GOPATH
ENTRYPOINT ["mbt"]
