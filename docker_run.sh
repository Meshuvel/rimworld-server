#!/bin/bash -ex
# Sample run script.  Primarly used in build / testing

docker rm rimworld
docker run -it -p 25555:25555/udp -p 25555:25555/tcp -v /app/docker/temp-vol:/rimworld \
--name rimworld \
meshuvel/rimworld-server:build
