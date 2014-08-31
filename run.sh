#!/bin/sh

RET=`service redis status`
if [[ $? -ne 0 ]]; then
    service redis start
fi

./bin/hubot --name p
