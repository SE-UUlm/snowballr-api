<div align="center">
    <picture>
        <img alt="SnowballR Logo" src="images/snowballr-logo-with-text.png" width="700"/>
    </picture>
</div>

<div align="center">
    <a href="https://github.com/SE-UUlm/snowballr-api/releases/latest">
        <img alt="Version" src="https://img.shields.io/github/v/release/SE-UUlm/snowballr-api?label=Version&color=light-green">
    </a>
    <a href="https://github.com/SE-UUlm/snowballr-api/actions/workflows/linting.yml">
        <img alt="Code Quality Workflow Status" src="https://img.shields.io/github/actions/workflow/status/SE-UUlm/snowballr-api/linting.yml?logo=github&label=Code%20Quality">
    </a>
    <a href="https://github.com/SE-UUlm/snowballr-api/pkgs/container/snowballr-api">
        <img alt="Docker" src="https://img.shields.io/badge/Docker-ghcr.io-blue">
    </a>
    <a href="https://snowballr.informatik.uni-ulm.de/docs/">
        <img alt="API Documentation" src="https://img.shields.io/badge/API Documentation-grey?logo=grpc">
    </a>
    <a href="https://deepwiki.com/SE-UUlm/snowballr-api">
        <img alt="Ask DeepWiki" src="https://deepwiki.com/badge.svg">
    </a>
    <a href="https://github.com/SE-UUlm/snowballr-api/blob/main/LICENSE">
        <img alt="License" src="https://img.shields.io/github/license/SE-UUlm/snowballr-api?label=License">
    </a>
</div>

# SnowballR API

This repository contains the API specification of the _SnowballR_ project.
For communication between the backend and frontend, [gRPC](https://grpc.io) is
used, whereas the services are defined by Protocol Buffers
(see [/proto](./proto/) for the service definition
(in [main.proto](./proto/main.proto)) and all required `.proto` files).

## Getting started

To integrate the API specification into the backend or frontend, download this repository in the build pipeline or add
it as a git submodule. Afterwards, use the protoc compiler to generate the relevant files for your project. When using
a TypeScript-based frontend, you can use the [snowballr-api NPM package](https://www.npmjs.com/package/snowballr-api),
which already contains the generated gRPC client and all relevant types.

When using it as a git submodule, execute the following commands:

```bash
git submodule add [-b branch] git@github.com:SE-UUlm/snowballr-api.git <name>
git submodule update --init --recursive
```

Then follow the [instructions](https://grpc.io/docs/languages/) on the gRPC documentation page to generate the relevant
files for your project.

## Release procedure

We create a new release whenever a set of features, bug fixes, or changes is ready to be integrated into the frontend /
backend. To release a new version of the API, follow the steps in the
[SnowballR Wiki](https://github.com/SE-UUlm/snowballr/wiki/Contributing#release-procedure).

Remember to also update the version in the
[package.json of the NPM package](https://github.com/SE-UUlm/snowballr-api/blob/main/npm-package/package.json).

To update the API when using it as a git submodule, checkout the new version tag in the submodule (see
[this StackOverflow post](https://stackoverflow.com/questions/1777854/how-can-i-specify-a-branch-tag-when-adding-a-git-submodule/1778247#1778247)
for additional information).

## Documentation

A static site documentation can be generated using
[Sabledocs](https://github.com/markvincze/sabledocs). To build the documentation locally, use docker:

```bash
docker build . -t snowballr-api
docker run -it -p 8080:80 snowballr-api:latest
```

The generated documentation is packaged into a docker container running [nginx](https://nginx.org/) and is served on the
internal port `80`.

Moreover, the documentation will also be built automatically after every push to `main` as well as after a version tag
has been set.

## Linting

This project is linted using [Protolint](https://github.com/yoheimuta/protolint).
[Just](https://github.com/casey/just) is used to ease the process of running the linter. There are the following two
recipes:

- `lint`: Prints all the detected issues with the proto files.
- `fix`: Automatically tries to fix all detected issues.

These actions can be invoked by providing them as a parameter to the `just` cli like this: `just (lint|fix)`.
