FROM rabbitmq:3.6-management-alpine

# VAR ${VAR: -"value"} means the values may be overriden

ENV RABBITMQ_NODENAME ${RABBITMQ_NODENAME:-"prooph"}
ENV RABBITMQ_ERLANG_COOKIE ${RABBITMQ_ERLANG_COOKIE:-"1752650cd92f14813b66e1c976c51cccedd224a7"}
ENV RABBITMQ_DEFAULT_USER ${RABBITMQ_DEFAULT_USER:-"prooph"}
ENV RABBITMQ_DEFAULT_PASS ${RABBITMQ_DEFAULT_PASS:-"prooph"}

ENV RABBITMQ_SSL_CACERTFILE ${RABBITMQ_SSL_CACERTFILE:-"/etc/rabbitmq/ssl/cacert.pem"}
ENV RABBITMQ_SSL_CERTFILE ${RABBITMQ_SSL_CERTFILE:-"/etc/rabbitmq/ssl/localhost.crt"}
ENV RABBITMQ_SSL_KEYFILE ${RABBITMQ_SSL_KEYFILE:-"/etc/rabbitmq/ssl/localhost.key"}
ENV RABBITMQ_SSL_VERIFY ${RABBITMQ_SSL_VERIFY:-"verify_none"}
ENV RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT ${RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT:-"false"}
# Override the default configuration that is created by the default entrypoint script
ENV RABBITMQ_CONFIG_FILE ${RABBITMQ_CONFIG_FILE:-"/etc/rabbitmq/rabbitmq-prooph"}
# Without this erlang argument you will not be able to connect over TLS using the rabbitctl cli tool
ENV RABBITMQ_CTL_ERL_ARGS ${RABBITMQ_CTL_ERL_ARGS:-"-proto_dist inet_tls"}

# Copy self signed certificates
COPY config/ssl/ /etc/rabbitmq/ssl

# Add custom plugins
COPY config/etc/enabled_plugins /etc/rabbitmq/enabled_plugins

# Insert custom configuration
COPY config/etc/rabbitmq-prooph.config /etc/rabbitmq/
RUN chown rabbitmq /etc/rabbitmq/rabbitmq-prooph.config && \
    chgrp rabbitmq /etc/rabbitmq/rabbitmq-prooph.config

# Add mgmt definitions
COPY config/opt/definitions.json /opt/definitions.json

