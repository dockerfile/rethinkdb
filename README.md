## RethinkDB Dockerfile


This repository contains **Dockerfile** of [RethinkDB](http://www.rethinkdb.com/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/rethinkdb`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/rethinkdb" github.com/dockerfile/rethinkdb`)


### Usage

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 dockerfile/rethinkdb --bind all

#### Run the first host of cluster

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 -v <data-dir>:/data dockerfile/rethinkdb --bind all --canonical-address `curl -s ipecho.net/plain` --machine-name `hostname | sed 's/-/_/g'`

#### Run subsequent hosts joining to cluster

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 -v <data-dir>:/data dockerfile/rethinkdb --bind all --canonical-address `curl -s ipecho.net/plain` --machine-name `hostname | sed 's/-/_/g'` --join <first-host-ip>:29015

Open `http://<host>:8080`.
