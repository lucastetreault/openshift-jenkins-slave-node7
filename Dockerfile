FROM openshift/jenkins-slave-base-centos7

MAINTAINER Ben Parees <bparees@redhat.com>

ENV NODEJS_VERSION=4.4 \
    NPM_CONFIG_PREFIX=$HOME/.npm-global \
    PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH \
    BASH_ENV=/usr/local/bin/scl_enable \
    ENV=/usr/local/bin/scl_enable \
    PROMPT_COMMAND=". /usr/local/bin/scl_enable"

COPY contrib/bin/scl_enable /usr/local/bin/scl_enable

# Install Node.js 7.x repository
RUN curl -sL https://rpm.nodesource.com/setup_7.x | bash -

# Install Node.js and npm
RUN yum install nodejs

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
