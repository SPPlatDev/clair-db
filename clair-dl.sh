#!/bin/bash

set -e

docker run --rm -d --link postgres:postgres -e PGPASSWORD=password $POSTGRES_IMAGE pg_isready -U postgres -h postgres
docker run --rm -d --name clair --link postgres:postgres $CLAIR_LOCAL_SCAN_IMAGE

sleep 10

