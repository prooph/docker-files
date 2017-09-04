# RabbitMQ Docker files with Alpine Linux

> These images are only for development environments

## Built upon

The [official](https://hub.docker.com/_/rabbitmq/) rabbitmq docker images, specifically alpine with the management plugin enabled.

## What does this image do?

- Configures rabbitmq to use TLS with a self-signed localhost certificate. 
- Enables the management plugin.
- Sets a default adminstrator `prooph` user with password `prooph`.
- Enables the webstomp plugin.
- Adds a vhost `proophessor-do`, a user `proophessor-do` with password `proophessor-do` and configures it's permissions.

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

Then navigate to [https://localhost:8080](https://localhost:8080) to login with user `prooph` and `prooph` as password.

## Websockets

We've enabled the webstomp plugin.

```
docker run -d --hostname my-rabbit --name rabbitmq -p 8080:15671 -p 15691:15691 prooph/rabbitmq
```

You'll need to connect to port 15691.


## Testing

To test the server with some standard examples from RabbitMQ spin up a webserver and navigate to [https://localhost:8080](https://localhost:8000)

```
php -S localhost:8000 -t rabbitmq/test 
```

## Configuration

Mount your own configuration to `/opt/definitions.json`. The easiest way to create a configuration file is by using
the management UI (see Get started section). Configure your exchanges etc. and then simply export the configuration file (overview tab).
Let docker mount the file into the container:

```
docker run -d --hostname my-rabbit --name rabbitmq -p 8080:15671 -v /my_config.json:/opt/definitions.json:ro prooph/rabbitmq
```
