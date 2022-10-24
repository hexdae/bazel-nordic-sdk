load("@rules_cc//cc:defs.bzl", "cc_library")

sdk_headers = glob(
    ["**/*.h"],
    exclude = glob(["examples/**"]),
)

sdk_includes = {
    "/".join(header.split("/")[:-1]): None
    for header in sdk_headers
}.keys()

cc_library(
    name = "hdrs",
    hdrs = sdk_headers,
    data = ["@nrf_sdk//:modules/nrfx/mdk"],
    includes = sdk_includes,
    linkopts = ["-L $(location @nrf_sdk//:modules/nrfx/mdk)"],
    visibility = ["//visibility:public"],
    deps = [":modules/nrfx/mdk/nrf_common.ld"],
    alwayslink = 1,
)

exports_files(glob(["**"]))
