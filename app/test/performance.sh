#!/bin/sh

siege --concurrent=10 --time=30s \
  --benchmar --verbose --log --delay=0 \
  "http://192.168.59.103:49160/pdf POST <./test.html"
