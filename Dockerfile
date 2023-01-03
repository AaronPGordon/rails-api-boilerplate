FROM ruby:3.1.3-slim-buster as ruby-builder

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get -y --no-install-recommends install \
    curl \
    cmake \
    pkg-config \
    libjemalloc2 \
    libpq-dev \
    shared-mime-info \
    graphicsmagick-imagemagick-compat \
    zlib1g-dev \
    fonts-roboto \
    libxrender1 \
    git \
    build-essential \
    file \
    python3 \
    g++ \
    make \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler:2.3.25

RUN gem update --system

WORKDIR /app
COPY Gemfile* /app

RUN bundle config --global frozen 1 \
 && bundle config set without 'production staging' \
 && bundle config set force_ruby_platform true \
 && bundle install -j4 --retry 3

COPY --chown=33:33 . /app
WORKDIR /app

COPY docker/build/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]