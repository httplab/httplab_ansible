FROM sjoerdmulder/teamcity-agent

ENV RUBY_VERSION 2.3.1

ENV RBENV_ROOT $HOME/.rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
ENV SHELL /bin/bash

RUN git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT
RUN git clone git://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

RUN echo 'eval "$(rbenv init -)"' >> $HOME/.profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update -q \
  && apt-get -q -y install autoconf bison build-essential libssl-dev libyaml-dev \
    libreadline6-dev ruby-dev zlib1g-dev liblzma-dev postgresql-server-dev-9.5 \
  && rbenv install $RUBY_VERSION \
  && rbenv global $RUBY_VERSION \
  && apt-get autoremove -y

RUN echo "gem: --no-ri --no-rdoc" > $HOME/.gemrc

RUN rbenv exec gem update --system \
  && rbenv exec gem update \
  && rbenv exec gem install bundler \
  && rbenv exec gem install rubocop \
  && rbenv rehash
