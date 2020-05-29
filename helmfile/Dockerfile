FROM vault:1.3.3 as vault
FROM ecosiadev/kubectl:v1.12.10 as kubectl
FROM alpine/helm:3.1.2 as helm
FROM chatwork/helmfile:0.116.0

COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
