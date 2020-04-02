FROM node:10.15.3-slim

RUN apt-get update && \
  apt-get install -y \
  libgtk2.0-0 \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  xvfb

RUN npm install -g npm@6.9.0
RUN npm install -g yarn@1.15.2
RUN npm install --unsafe-perm=true --allow-root -g cypress@3.4.1
