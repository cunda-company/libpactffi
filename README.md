# libpactffi

This project provides a Docker image containing the [libpact_ffi](https://github.com/pact-foundation/pact-reference) shared library, making it easy to use Pact FFI in your CI/CD pipelines or development environments.

## What is libpact_ffi?

`libpact_ffi` is a C Foreign Function Interface (FFI) library for the [Pact](https://pact.io) contract testing framework. It enables integration with Pact from various programming languages via FFI bindings.

## Docker Image

The provided Docker image is based on `ubuntu:latest` and includes the `libpact_ffi` shared library installed at `/usr/local/lib/pact_x86_64/libpact_ffi.so`.

### Supported Platforms
- `linux/amd64` (x86_64)
- `linux/arm64` (aarch64)

> **Note:** Docker images are not available for macOS (`darwin`). To use this image on a Mac, run it via Docker Desktop, which supports both Intel and Apple Silicon Macs using the `linux/amd64` or `linux/arm64` images.

## Usage

Pull the image from Docker Hub:

```sh
docker pull cundaai/libpactffi:latest
```

Run a container:

```sh
docker run --rm -it cundaai/libpactffi:latest bash
```

The `libpact_ffi` shared library will be available at `/usr/local/lib/pact_x86_64/libpact_ffi.so`.

## Building the Image Locally

To build the Docker image yourself:

```sh
docker build -t cundaai/libpactffi:latest .
```

## GitHub Actions: Automated Multi-Arch Builds

This repository includes a GitHub Actions workflow that automatically builds and pushes the Docker image to Docker Hub for both `linux/amd64` and `linux/arm64` platforms.

- The workflow is triggered on pushes to the `main` branch and via manual dispatch.
- Docker Hub credentials must be provided as repository secrets:
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN`

See `.github/workflows/docker-publish.yml` for details.

## Updating libpact_ffi Version

To update the version of `libpact_ffi` included in the image, edit the `Dockerfile` and change the download URL to the desired release version. Then, rebuild and push the image.

## Contributing

Contributions are welcome! Please open issues or pull requests for bug fixes, improvements, or new features.

## License

Copyright 2025 Cunda AI

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
