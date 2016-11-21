# Ansible + Amazon AWS CLI + Docker Image
This container contains Ansible, Amazon AWS CLI and Docker.

## Configuration files
You should mount specific config folders like `~/.aws` and `~/.ansible` to `/root`. 
[boto](http://boto.cloudhackers.com/en/latest/getting_started.html) is also installed and can be configured.

## Using Ansible
Run the following command with your arguments from the root of your Ansible project.

```bash
$ docker run -it --rm -v $(pwd):/app prooph/ansible-aws-cli ansible --help
$ docker run -it --rm -v $(pwd):/app prooph/ansible-aws-cli ansible-playbook --help
```

## Using Amazon AWS CLI

```bash
$ docker run -it --rm -v ~/.aws:/root/.aws prooph/ansible-aws-cli aws help
```

## Using Amazon AWS ECR
To login to the Amazon Container Registry (ECR) with your Amazon AWS credentials use:

```bash
$ docker run -it --rm -v ~/.aws:/root/.aws -v /var/run/docker.sock:/var/run/docker.sock prooph/ansible-aws-cli aws ecr get-login --region eu-central-1 | tr -d '\r\n' | xargs xargs
```
