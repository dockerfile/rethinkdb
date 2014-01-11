## RethinkDB Dockerfile


This repository contains **Dockerfile** of [RethinkDB](http://www.rethinkdb.com/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) published to the public [Docker Registry](https://index.docker.io/).


### Dependencies

* [dockerfile/ubuntu](https://github.com/dockerfile/ubuntu)


### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/dockerfile/rethinkdb/) from public [Docker Registry](https://index.docker.io/): `docker pull dockerfile/rethinkdb`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/rethinkdb" .`)


### Usage

    docker run dockerfile/rethinkdb

#### Running the first host of cluster

    docker run -name="rethinkdb" -d dockerfile/rethinkdb --bind all

#### Adding subsequent hosts to cluster

    docker run -name="rethinkdb" -d dockerfile/rethinkdb --join <first-host-ip>:29015 --bind all
