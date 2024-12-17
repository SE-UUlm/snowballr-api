# SnowballR API Definition

This repository contains the API specification of the *SnowballR* project.
For communication between the backend and frontend, [gRPC](https://grpc.io) is
used, whereas the services are defined by Protocol Buffers
(see [/proto](./proto/) for the service definition
(in [main.proto](./proto/main.proto)) and all required `.proto` files).

## Usage

To integrate the API specification into the backend or frontend, add
this repository as a git submodule in the corresponding repository.

In the backend / frontend repository, execute the following commands:

```bash
git submodule add [-b branch] git@github.com:SE-UUlm/snowballr-api.git <name>
git submodule update --init --recursive
```

Then follow the [instructions](https://grpc.io/docs/languages/) on the gRPC
documentation page to generate the relevant files for your project.

## Linting

This project is linted using
[Protolint](https://github.com/yoheimuta/protolint).
[Just](https://github.com/casey/just) is used to ease the process of running
the linter. There are the following two recipes:

- `lint`: Prints all the detected issues with the proto files.
- `fix`: Automatically tries to fix all detected issues.

These actions can be invoked by providing them as a parameter to the `just`
cli like this: `just (lint|fix)`.

## Documentation

Static Site Documentation can be generated using
[Sabledocs](https://github.com/markvincze/sabledocs). This will also happen
automatically after every push to `main` and `develop` as well as after a
version tag has been set. The generated documentation is packaged into a
docker container running [nginx](https://nginx.org/) and is served on the
internal port `80`.

The documentation can be built locally using docker:
```bash
docker build . -t snowballr-api
docker run -it -p 8080:80 snowballr-api:latest
```
