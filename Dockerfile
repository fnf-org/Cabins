# syntax=docker/dockerfile:1.2
FROM docker.io/ruby:3.1.1-slim-bullseye

RUN set -eus; \
    apt-get update -qq; \
    apt-get install -y \
    nodejs \
    libmariadb-dev-compat \
    libmariadb-dev \
    shared-mime-info \
    libmysql++-dev \
    build-essential \
    ; \
    apt-get clean; \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*;

WORKDIR /cabins
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /cabins

RUN RAILS_ENV=production SECRET_KEY_BASE=1 bundle exec rake assets:precompile

EXPOSE 3000
CMD "./entrypoint.sh"
