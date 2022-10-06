#!/bin/bash
trap "printf '\n' && trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

exec 3< <(go run . --port=9001 2>&1)
read <&3 line

if [[ $line =~ "Starting instance" ]]; then
  echo $line
  else
    exit 1
fi

RESULT=$(curl -H 'User-Agent:' -H 'Header1: header1' -H 'Header2: header2' localhost:9001)

WANT='Instance name: example
Accept: [*/*]
Header1: [header1]
Header2: [header2]'

printf "===\nResult:\n===\n$RESULT\n"; printf "Want:\n===\n$WANT\n";

if [[ "$RESULT" != "$WANT" ]]; then
  printf "test failed"; exit 1
  else
    echo "test passed"
fi