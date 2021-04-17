FROM elixir:1.11.3-slim

ENV NODE_VERSION=14.15.4 \
  PHOENIX_VERSION=1.5.7 \
  MIX_HOME=/root/.mix \
  MIX_ENV=prod \
  SECRET_KEY_BASE=${SECRET_KEY_BASE}

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
  build-essential \
  curl \
  git \
  gzip \
  inotify-tools \
  ssh \
  sudo \
  tar

RUN apt-get install -y nodejs npm
RUN npm install -g n
RUN n ${NODE_VERSION}
RUN apt-get purge -y nodejs npm
RUN node -v && npm -v

RUN mix local.hex --force && \
  mix local.rebar --force
RUN mix archive.install hex phx_new ${PHOENIX_VERSION} --force

RUN apt-get clean

CMD [ "mix", "phx.server", "--no-halt" ]
