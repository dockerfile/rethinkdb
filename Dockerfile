#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM dockerfile/ubuntu

# Install RethinkDB.
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb

# Expose ports for RethinkDB process, cluster, and web-ui.
EXPOSE 28015 29015 8080

# Mount directory.
VOLUME ["/rethinkdb"]
WORKDIR /rethinkdb

# Turn container into an executable.
ENTRYPOINT ["/usr/bin/rethinkdb"]
CMD ["--help"]
