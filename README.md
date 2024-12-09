# SnowballR API Definition

This repository contains the API specification of the *SnowballR* project.
For communication between the backend and frontend, [gRPC](https://grpc.io) is
used, whereas the services are defined by Protocol Buffers
(see [/proto](./proto/) for the service definiton
(in [main.proto](./proto/main.proto)) and all required `.proto` files).

## Usage

To use integrate the API specification into the backend or frontend, integrate
this repository as git submodule in the corresponding repository.

In the backend / frontend repository, execute the following commands:

```bash
git submodule add [-b branch] git@github.com:SE-UUlm/snowballr-api.git <name>
git submodule update --init --recursive

```

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
