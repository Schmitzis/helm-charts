#!/bin/bash

if command -v nerdctl 1>/dev/null 2>&1; then
    runtime="nerdctl"
elif command -v podman 1>/dev/null 2>&1; then
    runtime="podman"
elif command -v docker 1>/dev/null 2>&1; then
    runtime="docker"
else
    echo "No supported container runtime found"
    exit 1
fi

CMD="${runtime} run -ti \
    -v $PWD/ca:/var/lib/icinga2/ca \
    --user root \
    --entrypoint bash \
    registry.gitlab.com/olemisea/icinga2:2.12.3-master \
    -c ' \
    chown -R nagios:nagios /var/lib/icinga2/ca \
    && /usr/sbin/icinga2 api setup --log-level debug \
    && chown -R $UID:$UID /var/lib/icinga2/ca'"


mkdir -p ca

echo $CMD
eval $CMD

sudo chown -R $USER: ca/

kubectl create secret generic \
    -n icinga2 \
    icinga2-ca \
    --from-file=ca.crt=./ca/ca.crt \
    --from-file=ca.key=./ca/ca.key
