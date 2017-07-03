#!/usr/bin/env bash
set -e

(
    # try listing users until service is up
    # count=0; until rabbitmqctl list_users >/dev/null 2>/dev/null || (( count++ >= 30 )); do sleep 1; done

    # since the above doesn't work on alpine we use this smartness
    sleep 10

    rabbitmqctl add_vhost "proophessor-do" && \
    rabbitmqctl add_user "proophessor-do" "proophessor-do" && \
    rabbitmqctl set_permissions -p "proophessor-do" "proophessor-do"  ".*" ".*" ".*"
) &

# original entrypoint
exec docker-entrypoint.sh rabbitmq-server "$@"
