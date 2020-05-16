# Container that runs MusicBot with locally stored
# Python files
FROM ubuntu:18.04
MAINTAINER gc-plp, plp.github@gmail.com

# Bot requirements
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    unzip \
    software-properties-common \
    git \
    ffmpeg \
    libopus-dev \
    libffi-dev \
    libsodium-dev

# pyenv requirements
# https://github.com/pyenv/pyenv/wiki/common-build-problems
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \
    git

VOLUME /bot

ENV APP_ENV=docker

COPY dockerentry.sh /dockerentry.sh
ENTRYPOINT ["/dockerentry.sh"]
