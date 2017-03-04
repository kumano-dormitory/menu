FROM ruby:2.3.3-alpine
RUN gem install bundler
RUN apk update && apk add alpine-sdk
RUN apk add sqlite-dev nodejs
WORKDIR bundle-files
ADD Gemfile .
ADD Gemfile .lock
RUN bundle install
WORKDIR /app_readonly
CMD ./run.sh
