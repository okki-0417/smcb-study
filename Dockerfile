# syntax = docker/dockerfile:1

FROM ruby:3.3

WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get install -y nodejs

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

EXPOSE 3000

CMD [ "bin/dev" ]
