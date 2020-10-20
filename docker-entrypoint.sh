#!/usr/bin/env sh
#-----------------------------------------------------------------------------
#  Output good or bad message based on return status $?
#------------------------------------------------------------------------------
is_good(){
    STATUS=$?
    MSG_GOOD="$1"
    MSG_BAD="$2"
    
    if [ $STATUS -eq 0 ] ; then
        echo "${MSG_GOOD}"
    else
        echo "${MSG_BAD}"
    fi
}
# function is_good

echo '==== Running docker-entrypoint.sh ==='
set -eu

#-- redirect NGINX logs to STDOUT/STDERR
ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log
is_good '[ok] - redirected logs to stdout/stderr' \
'[not ok] - redirecting logs to stdout/stderr'

#-- Apply ENV vars
envsubst '${LAB1} ${LAB2}' < /hello-text.template > /etc/nginx/conf.d/hello-text.conf
is_good '[ok] - applied env vars into the config template' \
'[not ok] - applying env vars into the config template'

echo '[ok] - starting NGINX'
exec "$@"
