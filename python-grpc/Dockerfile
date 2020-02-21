FROM python:3.8-slim-buster

WORKDIR /src
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN pip install grpcio==1.27.2 grpcio-tools==1.27.2

RUN curl -L >protoc_gen_doc.tar.gz \
    https://github.com/pseudomuto/protoc-gen-doc/releases/download/v1.3.0/protoc-gen-doc-1.3.0.linux-amd64.go1.11.2.tar.gz \
    && tar -xzvf protoc_gen_doc.tar.gz  -C /usr/bin --strip-components=1 \
    && rm protoc_gen_doc.tar.gz \
    && chmod +x /usr/bin/protoc-gen-doc

ENTRYPOINT ["python", "-m", "grpc_tools.protoc"]