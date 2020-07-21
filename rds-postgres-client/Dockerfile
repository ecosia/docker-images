FROM alpine:3.9

ENV AWS_CLI_VERSION 1.15.66

RUN apk --no-cache add python py-pip groff \
    && pip --no-cache-dir install awscli==${AWS_CLI_VERSION} \
    && apk del py-pip

RUN apk add --update postgresql-client
