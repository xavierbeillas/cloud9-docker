FROM ubuntu:14.04

MAINTAINER Xavier Beillas

RUN apt-get update
RUN apt-get install -y build-essential curl git python2.7

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

RUN git clone https://github.com/c9/core.git /cloud9
WORKDIR /cloud9
RUN scripts/install-sdk.sh

RUN mkdir /workspace
VOLUME /workspace

RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80

ENTRYPOINT ["node", "/cloud9/server.js"]
CMD ["--port", "80", "--listen", "0.0.0.0", "-a", "admin:admin", "-w", "/workspace"]
