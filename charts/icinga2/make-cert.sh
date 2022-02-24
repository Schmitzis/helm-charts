#!/bin/bash

CMD="docker run -ti \
    -v $PWD/ca:/var/lib/icinga2/ca \
    --user root \
    --entrypoint bash \
    registry.gitlab.com/olemisea/icinga2:2.12.3-master \
    -c ' \
    chown -R nagios:nagios /var/lib/icinga2/ca \
    && /usr/sbin/icinga2 api setup --log-level debug \
    && chown -R $UID:$UID /var/lib/icinga2/ca'"

echo $CMD
eval $CMD

kubectl create secret generic \
    -n icinga2 \
    icinga2-ca \
    --from-file=ca.crt=./ca/ca.crt \
    --from-file=ca.key=./ca/ca.key
