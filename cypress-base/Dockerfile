FROM node:14.15.1-slim

RUN apt-get update && \
  apt-get install -y \
  libgtk2.0-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  xvfb

RUN npm install -g npm@6.14.6
RUN rm /usr/local/bin/yarnpkg /usr/local/bin/yarn
RUN npm install -g yarn@1.15.2
RUN npm install --unsafe-perm=true --allow-root -g cypress@3.4.1

RUN apt-get clean
