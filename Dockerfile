#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM dockerfile/ubuntu

# Install RethinkDB.
RUN \
  echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" > /etc/apt/sources.list.d/rethinkdb.list && \
  wget -O- http://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y rethinkdb python-pip && \
  rm -rf /var/lib/apt/lists/*

# Install python driver for rethinkdb
RUN pip install rethinkdb

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
