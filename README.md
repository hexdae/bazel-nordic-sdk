![Linux](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/Linux/badge.svg)
![macOS](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/macOS/badge.svg)
![Windows](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/Windows/badge.svg)

# Nodic nRF5 SDK Bazel toolchain

This repository is an example on how to compile the nRF5 SDK into a Bazel based project.

If this project was useful to you, give it a ⭐️ and I'll keep improving it!

## Using the nRF5 Bazel rules

### `WORKSPACE`

Check the [releases](https://github.com/hexdae/bazel-nordic-sdk/releases) page and copy the accurate workspace setup for the version you want.

This is an example of what to add to your workspace file, this includes a suitable ARM toolchain
used to compile the nrf source code. In this example we are going to use `arm-none-eabi-gcc` from
the [`bazel-arm-none-eabi`](https://github.com/hexdae/bazel-arm-none-eabi) repo

```python
# WORKSPACE
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

#---------------------------------------------------------------------
# ARM none eabi GCC
#---------------------------------------------------------------------
git_repository(
    name = "arm_none_eabi",
    commit = "eb08f73c8890baa153fa2f0de36cfacbb7552109",
    remote = "https://github.com/hexdae/bazel-arm-none-eabi",
    shallow_since = "1665997882 -0700",
)

load("@arm_none_eabi//:deps.bzl", "arm_none_eabi_deps")

arm_none_eabi_deps()
#---------------------------------------------------------------------

#---------------------------------------------------------------------
# nRF5 SDK dependencies
#---------------------------------------------------------------------
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
git_repository(
    name = "nRF5",
    commit = "<latest_commit>",
    remote = "https://github.com/hexdae/bazel-nrf-sdk",
)

load("@nRF5//:deps.bzl", "nRF5_deps")
nRF5_deps()
#---------------------------------------------------------------------
```

### `.bazelrc`

Enable `cc_toolchain` resolution

```bash
# .bazelrc

# Enable toolchain resolution
build --incompatible_enable_cc_toolchain_resolution
```

### `BUILD`

Then you can the `nrf_binary` rule to build firmware in your `BUILD` files.
Just use it as you would use the `cc_binary` rule, and by adding the custom
attributes `linker`, `sdk_srcs`, and `sdk_includes` if you need files from
the nRF5 SDK.

```python
# BUILD

# Your custom platform compiled with the arm-none-eabi-gcc toolchain.
platform(
    name = "nrf",
    constraint_values = [
        "@platforms//cpu:arm",
        "@platforms//os:none",
    ],
    visibility = ["//visibility:public"],
)

# Your custom nRF5 based firmware.
nrf_binary(
    name = "nrf_firmware",
    linker = "...",
    srcs = [...],
    includes = [...],
    sdk_srcs = [...],
    sdk_includes = [...],
)

```

To build the target, use the command

```bash
bazelisk build --platform=//:nrf //:nrf_firmware
```

Checkout the `examples` directory for inspiration.

## Testing the repository

### Bazel

[Install Bazel](https://docs.bazel.build/versions/master/install.html) for your platform. Installing with a package manager is recommended, especially on windows where additional runtime components are needed.

- [Ubuntu Linux](https://docs.bazel.build/versions/master/install-ubuntu.html): `sudo apt install bazel`
- [macOS](https://docs.bazel.build/versions/master/install-os-x.html): `brew install bazel`
- [Windows](https://docs.bazel.build/versions/master/install-windows.html): `choco install bazel`

### Bazelisk

`bazelisk` is a user-friendly launcher for `bazel`. Follow the install instructions in the [Bazelisk repo](https://github.com/bazelbuild/bazelisk)

Use `bazelisk` as you would use `bazel`, this takes care of using the correct Bazel version for each project by using the [.bazelversion](./.bazelversion) file contained in each project.

### Clone the repo

`git clone https://github.com/d-asnaghi/bazel-nordic-sdk.git`

### Build examples

Use this command to build all the `examples` target for the pca10040 evaluation board.

```bash
# build the project
bazelisk build --platforms=//platforms:pca10056 //examples
```

This will take care of downloading the appropriate toolchain for your OS and compile all the source files specified by the target.

To build for the `pca10056` and `pca10100` evaluation boards, just use `--platforms=//platforms:pca10056` and `--platforms=//platforms:pca10100` respectively.