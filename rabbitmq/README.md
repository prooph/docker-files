# RabbitMQ Docker files with Alpine Linux

> These images are only for development environments

## Built upon

The [official](https://hub.docker.com/_/rabbitmq/) rabbitmq docker images, specifically alpine with the management plugin enabled.

## What does this image do?

- Configures rabbitmq to use TLS with a self-signed localhost certificate. 
- Enables the management plugin.
- Sets a default `prooph` user with password `prooph`.
- Mounts /app as application folder.

## What doesn't it do?

- Have a persisted database.
- Managing fine grained users, vhosts and permissions.
- Cluster setup.
- Allows for plugin configuration.

## Get started

Use the following image: `prooph/rabbitmq`.

```
docker run -d --hostname my-rabbit --name rabbitmq -p 8080:15671 prooph/rabbitmq
```

Then navigate to [https://localhost:8080](https://localhost:8080) to login with user prooph and prooph as password.
