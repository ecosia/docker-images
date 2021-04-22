FROM ecosiadev/cypress-base:3.7.1

RUN apt-get update && \
  apt-get install -y curl

# install latest stable Chrome
RUN curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  apt-get install -y ./google-chrome-stable_current_amd64.deb && \
  rm google-chrome-stable_current_amd64.deb

RUN apt-get clean
