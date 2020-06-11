# WORKSPACE
workspace(name = "nRF5")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# SDK: nRF5.
http_archive(
    name = "nrf_sdk",
    build_file = "@nRF5//sdk:nRF5.BUILD",
    sha256 = "28f336d929b64f501d826187f7208d4c0e3cde6a4de6c9f1ce1ee7b34441f9ff",
    url = "https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/nRF5_SDK_16.0.0_98a08e2.zip",
)

# Toolchain: arm-none-eabi-gcc.
http_archive(
    name = "arm_none_eabi",
    sha256 = "a6dbabaabfc0150862c8cab20db11422b785c4cff4e13bd12281725ecacdf886",
    strip_prefix = "bazel-arm-none-eabi-1.0",
    url = "https://github.com/d-asnaghi/bazel-arm-none-eabi/archive/v1.0.tar.gz",
)

load("@arm_none_eabi//:deps.bzl", "arm_none_eabi_deps")

arm_none_eabi_deps()
