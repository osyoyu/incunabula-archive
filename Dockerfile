FROM sorah/ruby:3.0-dev-focal

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

COPY . /app

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
