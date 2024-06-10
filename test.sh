#!/bin/bash

trap "printf '\n' && trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

set -x

# example docker:
# CMD="docker run --rm -i -p 9001:9001 <image> --port=9001" ./test.sh
exec 3< <(${CMD="go run . --port=9001"} 2>&1)
read <&3 line

set +x

if [[ $line =~ "Starting instance" ]]; then
  echo $line
  else
    exit 1
fi

RESULT=$(curl -s -H 'User-Agent:' -H 'Header1: header1' -H 'Header2: header2' localhost:9001)

WANT='Instance name: example
Accept: [*/*]
Header1: [header1]
Header2: [header2]
Host: [localhost:9001]'

printf "===\nResult:\n===\n$RESULT\n"; printf "===\nWant:\n===\n$WANT\n===\n";

if [[ "$RESULT" != "$WANT" ]]; then
  printf "test failed"; exit 1
  else
    echo "test passed"
fi

RESULT=$(curl -s -w "%{http_code}\n" "localhost:9001/livenessProbe")

if [[ "$RESULT" != 200 ]]; then
  printf "test failed"; exit 1
    else
      echo "test passed"
fi

RESULT=$(curl -s -w "%{http_code}\n" "localhost:9001/readinessProbe")

if [[ "$RESULT" != 200 ]]; then
  printf "test failed"; exit 1
    else
      echo "test passed"
fi

# Hello World
