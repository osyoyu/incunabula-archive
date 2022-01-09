FROM sorah/ruby:3.0-dev-focal

ARG SECRET_KEY_BASE=123

RUN apt-get update \
  && apt-get install -y \
    libmysqlclient-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

# RubyGems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

RUN bundle exec rails assets:precompile

COPY . /app

CMD ["bundle", "exec", "puma", "-t", "0:16"]
