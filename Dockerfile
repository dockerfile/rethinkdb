#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM dockerfile/ubuntu

# Install RethinkDB.
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb

# Mount directory.
VOLUME ["/rethinkdb"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080 28015 29015

# Turn this container into an executable.
ENTRYPOINT ["rethinkdb -d /rethinkdb"]
