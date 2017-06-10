#! /usr/bin/env bash

set -x

echo "Rolling restart of all rabbitmq containers..."

sleep 5

docker restart -t 1 rabbitpost_rabbit-1_1
sleep 30

docker restart -t 1 rabbitpost_rabbit-2_1
sleep 30

docker restart -t 1 rabbitpost_rabbit-3_1
sleep 30
