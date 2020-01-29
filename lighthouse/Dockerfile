FROM node:10-alpine

RUN apk add --update --quiet \
    chromium \
    chromium-chromedriver \
    xvfb
RUN npm install -g lighthouse lighthouse-ci
COPY entrypoint.sh ./entrypoint.sh
COPY .lighthouse.config.json ./.lighthouse.config.json

USER guest
ENV CI=true

ENTRYPOINT ["./entrypoint.sh"]
