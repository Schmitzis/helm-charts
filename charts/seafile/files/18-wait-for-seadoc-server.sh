#!/bin/sh
set -eu

if [ "${WAIT_FOR_SEADOC_SERVER:-true}" != "true" ]; then
    exit 0
fi

seadoc_ping_url="${SEADOC_SERVER_PING_URL:-http://127.0.0.1/}"

until curl --fail --silent --show-error "$seadoc_ping_url" >/dev/null; do
    echo "Waiting for SeaDoc server at ${seadoc_ping_url}"
    sleep 2
done

echo "SeaDoc server is ready"
