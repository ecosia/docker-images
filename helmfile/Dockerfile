FROM vault:1.3.3 as vault
FROM chatwork/helmfile:0.111.0
COPY --from=vault /bin/vault /usr/local/bin/vault
