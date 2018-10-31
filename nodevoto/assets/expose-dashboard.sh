#!/bin/bash

if [! -f /usr/local/bin/ngrok ]; then
  curl https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip 2> /dev/null \
    | zcat > /usr/local/bin/ngrok \
    && chmod a+x /usr/local/bin/ngrok
fi

start-stop-daemon --status --pidfile /tmp/dashboard.pid

if [ $? -ne 0 ]; then
  start-stop-daemon \
    --background \
    --make-pidfile \
    --pidfile /tmp/dashboard.pid \
    -S \
    --startas /bin/bash \
    -- -c "exec kubectl -n linkerd port-forward svc/web 9094:8084 &> /root/dashboard.log"
fi

start-stop-daemon --status --pidfile /tmp/ngrok-dashboard.pid

if [ $? -ne 0 ]; then
  start-stop-daemon \
    --background \
    --make-pidfile \
    --pidfile /tmp/ngrok-dashboard.pid \
    -S \
    --startas /bin/bash \
    -- -c "exec /usr/local/bin/ngrok http --log stdout --log-level debug 9094 &> /root/ngrok.log"
  sleep 3
fi

printf "The dashboard is available at:\n\n"

export DASHBOARD=$(cat ngrok.log \
  | sed -n 's/.* URL:\([^ ]*\) .*/\1/p' \
  | head -n1)

echo ${DASHBOARD}

printf "\ncut and paste this URL into your browser.\n"
