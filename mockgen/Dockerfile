FROM golang:1.14.1

ARG VERSION
ENV VERSION=1.4.2

RUN apt-get update && apt-get install -yqq \
  curl \
  gcc

# Install Mockgen
WORKDIR /usr/bin
RUN curl -L >mockgen.tar.gz https://github.com/golang/mock/releases/download/v${VERSION}/mock_${VERSION}_linux_amd64.tar.gz \
 && tar -xzvf mockgen.tar.gz \
 && mv mock_${VERSION}_linux_amd64/mockgen mockgen \
 && chmod +x mockgen \
 && rm mockgen.tar.gz

CMD ["mockgen"]
