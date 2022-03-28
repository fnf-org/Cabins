FROM ruby:3.1.1-slim-bullseye

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

RUN mkdir /cabins
WORKDIR /cabins
COPY Gemfile  ./
RUN bundle install

COPY . /cabins

EXPOSE 3000
CMD "./entrypoint.sh"
