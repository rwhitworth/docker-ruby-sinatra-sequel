FROM ruby:2.4-slim-stretch

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
         libterm-readline-gnu-perl ruby libc-dev ruby-dev make gcc g++ \
         libsqlite3-dev libpq-dev curl \
    && apt-get clean

RUN gem update \
    && gem install sinatra thin pry \
    && gem install sequel sqlite3 pg

EXPOSE 4567

ENTRYPOINT ["ruby", "/opt/scripts/run.rb"]
