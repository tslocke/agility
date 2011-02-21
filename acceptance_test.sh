#!/usr/bin/env bash
set -e
mongrel_rails start -e test -p 3002 &
pid=$!
sleep 10
rake test:acceptance
kill $pid || true
sleep 1
kill -9 $pid || true
