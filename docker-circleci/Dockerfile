FROM docker:19

RUN apk upgrade && \
    apk add --update \
    make \
    git \
    bash \
    openssh-client \
    python3 \
    parallel

RUN pip3 install --user awscli
ENV PATH="~/.local/bin:${PATH}"

