FROM sjoerdmulder/teamcity-agent

ENV RUBY_VERSION 2.3.1
ENV AGENT_HOME /home/teamcity
ENV RBENV_ROOT $AGENT_HOME/.rbenv
ENV SHELL /bin/bash

# Add postgres apt repo and key
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Install dependencies and ruby
RUN apt-get update -q && \
    apt-get -q -y install autoconf bison build-essential libssl-dev libyaml-dev \
                  libreadline6-dev ruby-dev zlib1g-dev liblzma-dev postgresql-server-dev-9.5 \
                  chrpath libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev && \
    apt-get autoremove -y

# Instal pahntomjs
ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    rm -rf /usr/local/share/$PHANTOM_JS && \
    mv $PHANTOM_JS /usr/local/share && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

USER teamcity
ENV SHELL /bin/bash
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH
# Clone rbenv repository and configure agent user environment
RUN git clone git://github.com/sstephenson/rbenv.git $RBENV_ROOT && \
    git clone git://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

RUN echo "PATH=$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH" >> $HOME/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> $HOME/.profile && \
    echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc && \
    echo 'gem: --no-ri --no-rdoc' > $HOME/.gemrc

# Install gems
RUN rbenv install $RUBY_VERSION && \
    rbenv global $RUBY_VERSION && \
    rbenv exec gem update --system && \
    rbenv exec gem update && \
    rbenv exec gem install bundler && \
    rbenv exec gem install rubocop && \
    rbenv rehash

USER root
