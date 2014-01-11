#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM dockerfile/ubuntu

# Install RethinkDB.
RUN add-apt-repository -y ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb

# Mount directory.
VOLUME ["/rethinkdb"]
WORKDIR /rethinkdb

# Turn this container into an executable.
ENTRYPOINT ["rethinkdb"]
CMD ["-h"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080 28015 29015
