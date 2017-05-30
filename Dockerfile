FROM openshift/jenkins-slave-base-centos7

MAINTAINER Lucas Tetreault <lucastetreault@gmail.com>

RUN yum upgrade -y
RUN yum install -y gcc-c++ tar

# Install Node.js 7.x repository
RUN curl -sL https://rpm.nodesource.com/setup_7.x | bash -

# Install Node.js and npm
RUN yum install nodejs -y

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
