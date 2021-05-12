FROM ruby:2.5.1

RUN apt-get update -qq && \
    apt-get install -y apt-utils \
    build-essential \
    libpq-dev \
    nodejs \
    vim \
    default-mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /saunars-circle 
ENV APP_ROOT /saunars-circle
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

ENV BUNDLER_VERSION 1.16.6
RUN gem install bundler && \
    bundle install -j4 --without development test && \
    bundle exec rails assets:precompile

COPY . $APP_ROOT