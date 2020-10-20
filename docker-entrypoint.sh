#!/usr/bin/env sh
set -eu

envsubst '${LAB1} ${LAB2}' < /hello-text.template > /etc/nginx/conf.d/hello-text.conf

exec "$@"
