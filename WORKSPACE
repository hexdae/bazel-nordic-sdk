# WORKSPACE
workspace(name = "nRF5")

# nRR5 SDK.
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "nrf_sdk",
    build_file = "@nRF5//sdk:nRF5.BUILD",
    sha256 = "28f336d929b64f501d826187f7208d4c0e3cde6a4de6c9f1ce1ee7b34441f9ff",
    url = "https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/nRF5_SDK_16.0.0_98a08e2.zip",
)

# ARM none eabi toolchain.
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "arm_none_eabi",
    commit = "d4b74ebaa8e3605a3b4738bae1e43d2e41e34957",
    remote = "https://github.com/d-asnaghi/bazel-arm-none-eabi.git",
    shallow_since = "1591836252 -0400",
)

load("@arm_none_eabi//:deps.bzl", "arm_none_eabi_deps")

arm_none_eabi_deps()
