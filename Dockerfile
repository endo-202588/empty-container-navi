FROM ruby:3.3

RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bin/rails", "server", "-b", "0.0.0.0"]