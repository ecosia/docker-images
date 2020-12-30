FROM vault:1.3.3 as vault
FROM ecosiadev/kubectl:v1.15.12 as kubectl
FROM alpine/helm:3.1.2 as helm
FROM mozilla/sops:v3.6.1-alpine as sops
FROM chatwork/helmfile:0.135.0

COPY --from=sops /usr/local/bin/sops /usr/local/bin/sops
COPY --from=vault /bin/vault /usr/local/bin/vault
COPY --from=kubectl /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=helm /usr/bin/helm /usr/local/bin/helm
