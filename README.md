![Linux](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/Linux/badge.svg)
![macOS](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/macOS/badge.svg)
![Windows](https://github.com/d-asnaghi/bazel-nordic-sdk/workflows/Windows/badge.svg)

# Nodic nRF5 SDK Bazel toolchain

This repository is an example on how to compile the nRF5 SDK into a Bazel based project.

If this project was useful to you, give it a ⭐️ and I'll keep improving it!

## Instructions

### Bazel

[Install Bazel](https://docs.bazel.build/versions/master/install.html) for your platform. Installing with a package manager is recommended, especially on windows where additional runtime components are needed.

- [Ubuntu Linux](https://docs.bazel.build/versions/master/install-ubuntu.html): `sudo apt install bazel`
- [macOS](https://docs.bazel.build/versions/master/install-os-x.html): `brew install bazel`
- [Windows](https://docs.bazel.build/versions/master/install-windows.html): `choco install bazel`

### Bazelisk

`bazelisk` is a user-friendly launcher for `bazel`. Follow the install instructions in the [Bazelisk repo](https://github.com/bazelbuild/bazelisk)

Use `bazelisk` as you would use `bazel`, this takes care of using the correct Bazel version for each project by using the [.bazelversion](./.bazelversion) file contained in each project.


### Build

Use this command to build the `project` target.

```bash
# build the project
bazelisk build project:all
```

This will take care of downloading the appropriate toolchain for your OS and compile all the source files specified by the target.
