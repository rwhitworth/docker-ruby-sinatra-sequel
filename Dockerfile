FROM debian:jessie-slim

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get clean

RUN apt-get update && \
    apt-get -y --no-install-recommends install libterm-readline-gnu-perl \
      ruby libc-dev ruby-dev make gcc g++ libsqlite3-dev libpq-dev \
      libmysqlclient-dev libmysqld-dev curl && \
    apt-get clean

RUN gem update 
RUN gem install sinatra thin pry
RUN gem install sequel sqlite3 pg mysqlplus
