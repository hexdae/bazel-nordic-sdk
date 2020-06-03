load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def nRF5_deps():

    # nRF5 SDK.
    http_archive(
        name = "nrf-sdk",
        build_file = "@nRF5//sdk:nrf5.BUILD",
        sha256 = "28f336d929b64f501d826187f7208d4c0e3cde6a4de6c9f1ce1ee7b34441f9ff",
        url = "https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v16.x.x/nRF5_SDK_16.0.0_98a08e2.zip",
    )

    # ARM none eabi toolchain.
    git_repository(
        name = "arm_none_eabi",
        remote = "https://github.com/d-asnaghi/bazel-arm-none-eabi.git",
        branch = "master"
    )

    # Bazel skylib.
    http_archive(
        name = "bazel_skylib",
        sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        ],
    )