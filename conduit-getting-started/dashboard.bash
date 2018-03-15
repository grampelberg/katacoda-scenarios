#!/bin/bash

curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip 2> /dev/null \
  | zcat > /usr/local/bin/ngrok \
  && chmod a+x /usr/local/bin/ngrok

conduit dashboard --port 8080 --url &> conduit.log &

ngrok http \
  --log stdout \
  --log-level debug \
  --host-header rewrite \
  8080 &> ngrok.log &

sleep 3

echo "The dashboard is available at:"

echo $(cat ngrok.log \
  | sed -n 's/.* URL:\([^ ]*\) .*/\1/p' \
  | head -n1)"/api/v1/namespaces/conduit/services/web:http/proxy/"

echo "cut and paste this URL into your browser."
