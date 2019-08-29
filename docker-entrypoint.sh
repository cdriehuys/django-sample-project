#!/bin/sh

set -euf

MANAGE_PATH=/opt/app/sample/manage.py
MANAGE_CMD="python ${MANAGE_PATH}"

if [ "$1" = 'migrate' ]; then
    ${MANAGE_CMD} migrate
    exit 0
fi;

if [ "$1" = 'server' ]; then
    shift
    cd /opt/app/sample
    exec gunicorn sample.wsgi:application $@
fi

echo "Unrecognized command: $1"
exit 1
