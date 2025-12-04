# SnowballR API

This repository contains the API specification of the _SnowballR_ project.
For communication between the backend and frontend, [gRPC](https://grpc.io) is
used, whereas the services are defined by Protocol Buffers
(see [/proto](./proto/) for the service definition
(in [main.proto](./proto/main.proto)) and all required `.proto` files).

## Getting started

To integrate the API specification into the backend or frontend, add
this repository as a git submodule in the corresponding repository.

In the backend / frontend repository, execute the following commands:

```bash
git submodule add [-b branch] git@github.com:SE-UUlm/snowballr-api.git <name>
git submodule update --init --recursive
```

Then follow the [instructions](https://grpc.io/docs/languages/) on the gRPC
documentation page to generate the relevant files for your project.
For example, in the [snowballr-frontend](https://github.com/SE-UUlm/snowballr-frontend) you can use the command
`npm run compile:proto` to generate the gRPC client.

## Release procedure

We create a new release whenever a set of features, bug fixes, or changes is ready to be integrated into the frontend /
backend. To release a new version of the API, follow the steps in the
[SnowballR Wiki](https://github.com/SE-UUlm/snowballr/wiki/Contributing#release-procedure).

To update the API in the frontend or backend or any other repository using this API, checkout the new version tag in the
submodule (see
[this StackOverflow post](https://stackoverflow.com/questions/1777854/how-can-i-specify-a-branch-tag-when-adding-a-git-submodule/1778247#1778247)
for additional information).

## Documentation

A static site documentation can be generated using
[Sabledocs](https://github.com/markvincze/sabledocs). To build the documentation locally, use docker:

```bash
docker build . -t snowballr-api
docker run -it -p 8080:80 snowballr-api:latest
```

The generated documentation is packaged into a
docker container running [nginx](https://nginx.org/) and is served on the
internal port `80`.

Moreover, the documentation will also be built automatically after every push to `main` as well as after a
version tag has been set.

## Linting

This project is linted using
[Protolint](https://github.com/yoheimuta/protolint).
[Just](https://github.com/casey/just) is used to ease the process of running
the linter. There are the following two recipes:

- `lint`: Prints all the detected issues with the proto files.
- `fix`: Automatically tries to fix all detected issues.

These actions can be invoked by providing them as a parameter to the `just`
cli like this: `just (lint|fix)`.
