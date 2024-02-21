#!/bin/bash

SENTRY_KEY=$1
PROJECT_ID=$2
EVENT_ID=`head -c16 </dev/urandom|xxd -p -u`
EVENT_TIMESTAMP=`date +"%Y-%m-%dT%H:%M:%S"`
SENTRY_TIMESTAMP=`date +%s`

curl --data "{ \"event_id\": \"$EVENT_ID\", \"timestamp\": \"$EVENT_TIMESTAMP\", \"message\": \"error\" }" \
    -H 'Content-Type: application/json' \
    -H "X-Sentry-Auth: Sentry sentry_version=7, sentry_key=$SENTRY_KEY, sentry_client=raven-bash/0.1 sentry_timestamp=$SENTRY_TIMESTAMP " \
    http://localhost:9000/sentry/api/$PROJECT_ID/store/