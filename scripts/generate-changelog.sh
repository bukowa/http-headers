#!/bin/bash
set -eux

echo "Building docker image for git-cliff..."

GIT_CLIFF=$(docker build -q - <<EOF
  FROM ghcr.io/orhun/git-cliff/git-cliff:sha-0f38960
  WORKDIR /workdirvol
  ENTRYPOINT ["git-cliff"]
EOF
)

docker run --rm \
  --volume="${PWD}:/workdirvol" \
  -u "$(id -u)" \
  "${GIT_CLIFF}" \
  "$@"
