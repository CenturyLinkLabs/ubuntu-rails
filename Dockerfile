FROM ubuntu:14.04

ENV RUBY_MAJOR 2
ENV RUBY_MINOR 2
ENV RUBY_TEENY 2

RUN apt-get update && apt-get install -y wget
RUN cd /tmp && sudo wget ftp://ftp.ruby-lang.org/pub/ruby/$RUBY_MAJOR.$RUBY_MINOR/ruby-$RUBY_MAJOR.$RUBY_MINOR.$RUBY_TEENY.tar.gz 
WORKDIR /tmp
RUN sudo apt-get install -y build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs 
RUN tar xvfz ruby-$RUBY_MAJOR.$RUBY_MINOR.$RUBY_TEENY.tar.gz && rm -f ruby-$RUBY_MAJOR.$RUBY_MINOR.$RUBY_TEENY.tar.gz
WORKDIR ruby-$RUBY_MAJOR.$RUBY_MINOR.$RUBY_TEENY
RUN ./configure && make && sudo make install && sudo gem update --system && echo "gem: --no-ri --no-rdoc" > ~/.gemrc && gem install bundler
