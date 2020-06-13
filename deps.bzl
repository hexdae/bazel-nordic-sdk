""" WORKSPACE dependencies for the nRF SDK """

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def nRF5_deps():
    # SDK: nRF5.
    http_archive(
        name = "nrf_sdk",
        build_file = "@nRF5//sdk:nrf_sdk.BUILD",
        sha256 = "28f336d929b64f501d826187f7208d4c0e3cde6a4de6c9f1ce1ee7b34441f9ff",
        url = "https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/nRF5_SDK_16.0.0_98a08e2.zip",
    )

    # Toolchain: arm-none-eabi-gcc.
    http_archive(
        name = "arm_none_eabi",
        sha256 = "3d3728cbe88b08c12cd2cb89afcff9294bd77be958c78188db77fdc8ab7e7a5d",
        strip_prefix = "bazel-arm-none-eabi-1.1",
        url = "https://github.com/d-asnaghi/bazel-arm-none-eabi/archive/v1.1.tar.gz",
    )
