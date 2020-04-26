FROM ecosiadev/kubectl:v1.12.10

ENV AWS_CLI_VERSION 1.18.46

RUN apk update && apk --no-cache add python py-pip groff \
    && pip install --upgrade pip \
    && pip --no-cache-dir install awscli==${AWS_CLI_VERSION} \
    && apk del py-pip
