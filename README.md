## RethinkDB Dockerfile


This repository contains **Dockerfile** of [RethinkDB](http://www.rethinkdb.com/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](https://github.com/dockerfile/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/rethinkdb`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/rethinkdb" github.com/dockerfile/rethinkdb`)


### Usage

#### Run the first host of cluster

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 dockerfile/rethinkdb --bind all --canonical-address <first-host-ip>

#### Run subsequent hosts joining to cluster

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 dockerfile/rethinkdb --bind all --join <first-host-ip>:29015
