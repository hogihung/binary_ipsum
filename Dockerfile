# This file to be used with Docker.  It will create a basic environment for a
# small Ruby based application to accompany the Binary Ipsum talk.  Included is
# Ruby 2.2.3p173, as well as Vim 7.4.712.  This is a very compact, low thrills
# build based off of alpine.

FROM alpine:3.2
MAINTAINER John F. Hogarty <john_hogarty@ognt.io>

ENV BUILD_PACKAGES bash vim curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

# Update and install all of the required packages.
# Clean the apk cache after install.
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

# Setup our application in Docker
RUN mkdir /usr/binary_ipsum
WORKDIR /usr/binary_ipsum

COPY Gemfile /usr/binary_ipsum/
COPY Gemfile.lock /usr/binary_ipsum/
RUN bundle install

COPY . /usr/binary_ipsum

# Resource:
# http://blog.codeship.com/build-minimal-docker-container-ruby-apps/
