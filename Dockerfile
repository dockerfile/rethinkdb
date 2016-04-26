FROM debian:jessie
MAINTAINER Elifarley Cruz <elifarley@gmail.com>

ADD http://download.rethinkdb.com/apt/pubkey.gpg /etc/apt/rethinkdb-pubkey.gpg

ENV RM_ITEMS '/tmp/* /var/tmp/* /var/backups/* /usr/share/man /usr/share/doc /var/lib/apt/lists/*'

RUN printf 'APT::Get::Install-Recommends "false";\nDpkg::Options {\n"--force-confdef";\n"--force-confold";\n}' \
  > /etc/apt/apt.conf.d/local && \
  echo "deb http://download.rethinkdb.com/apt jessie main" > /etc/apt/sources.list.d/rethinkdb.list && \
  apt-key add /etc/apt/rethinkdb-pubkey.gpg && \
  apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y --no-install-recommends rethinkdb python-pip && \
  apt-get autoremove --purge -y && apt-get clean && \
  pip install rethinkdb && \
  rm -rf $RM_ITEMS

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

ENTRYPOINT ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080 28015 29015
