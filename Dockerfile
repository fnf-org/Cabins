FROM ruby:3.1.1

RUN apt-get update -qq \
&& apt-get install -y nodejs libmariadb-dev-compat libmariadb-dev

RUN mkdir /cabins
WORKDIR /cabins
COPY Gemfile Gemfile.lock ./
RUN bundle install

ADD . /cabins

EXPOSE 3000
CMD "./entrypoint.sh"

