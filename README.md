# SnowballR API Definition

This repository contains the API specification of the *SnowballR* project.
For communication between the backend and frontend, [gRPC](https://grpc.io) is used, whereas
the services are defined by Protocol Buffers (see [/proto](./proto/main) for the service definiton and
all required `.proto` files).

## Usage

To use integrate the API specification into the backend or frontend, integrate this
repository as git submodule in the corresponding repository.

In the backend / frontend repository, execute the following commands:

```{bash}
git submodule add git@github.com:SE-UUlm/snowballr-api.git --name api
git submodule update --init --recursive

```

<!-- TODO; add sectuibs about compiling and documentation>