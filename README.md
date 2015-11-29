Cloud 9 dockerfile
==================

A cloud9 environment based on ubuntu 14.04 with minimal dependencies added.

# Build

    docker build -t cloud9 .

# Usage

## Default

    docker run -d -p 80:80 --name cloud9 cloud9

## Custom

    docker run -d -p 80:80 --name cloud9 cloud9 --port 80 --listen 0.0.0.0 -a login:password -w /workspace
