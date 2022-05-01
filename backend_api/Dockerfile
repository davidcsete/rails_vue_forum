FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
    runtime-deps \
    build-base \
    libxml2-dev \
    libxslt-dev \
    mysql-client \
    mariadb-dev \
    mariadb-client \
    nodejs \
    yarn \
    libffi-dev \
    git \
    tzdata \
    && rm -rf /var/cache/apk/*

RUN gem install --default mysql2 -v '0.5.3' --source 'https://rubygems.org'

WORKDIR /webapp
COPY . /webapp/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install

ENTRYPOINT [ "bin/rails" ]
CMD [ "s", "-b", "0.0.0.0" ]
EXPOSE 3000
