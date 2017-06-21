# Introduction

The aim of this container image is to eliminate the need to `php-cs-fixer` in the composer requirements for each project we do. This image can be used on any environment that has Docker installed including a CI pipeline.

# Usage

Mount code to `/app` on the container and we will test again prooph's rules.

```
$ docker run --rm -v $(pwd):/app prooph/php-cs-test
```
