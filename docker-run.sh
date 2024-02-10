#!/bin/bash

set -eu

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run --rm -it -d --publish 9203:9201 --expose 9201 \
  -e node.name=fn-dm-bees-omni-data-01 \
  -e discovery.type=single-node \
  -e http.port=9201 \
  -e http.cors.enabled=true \
  -e http.cors.allow-origin=* \
  -e http.cors.allow-headers=X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization \
  -e http.cors.allow-credentials=true \
  -e xpack.security.enabled=false \
  -e bootstrap.system_call_filter=false \
  -e ES_JAVA_OPTS="-Xms1g -Xmx1g" \
  -v "$SCRIPTDIR:/FN-BEES-Services/" \
  fn-CICD-basic-api:omni_es


docker run --rm --platform linux/amd64 -it -d \
  --name fn-cicd-basic-api --publish 15555:5555 --expose 5555 \
  --network bridge \
  -e ES_HOST=http://host.docker.internal:9203 \
  -v "$SCRIPTDIR:/app/FN-Basic-Services/" \
  fn-cicd-basic-api:es


