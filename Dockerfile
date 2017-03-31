FROM ruby:2.4

WORKDIR /usr/src/app

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 5.0.2

WORKDIR /usr/src/app

RUN gem install rails --version "$RAILS_VERSION"

COPY . /usr/src/app

RUN bundle install

EXPOSE 80

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80"]