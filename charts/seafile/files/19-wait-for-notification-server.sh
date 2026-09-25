#!/bin/sh
set -eu

if [ "${WAIT_FOR_NOTIFICATION_SERVER:-true}" != "true" ]; then
    exit 0
fi

notification_ping_url="${NOTIFICATION_SERVER_PING_URL:-http://127.0.0.1:8083/ping}"

until curl --fail --silent --show-error "$notification_ping_url" >/dev/null; do
    echo "Waiting for notification-server at ${notification_ping_url}"
    sleep 2
done

echo "Notification server is ready"
