load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "hdrs",
    srcs = glob(["**/*.h"]),
    hdrs = glob(["**/*.h"]),
    linkopts = ["-L $(location @nrf_sdk//:modules/nrfx/mdk)"],
    alwayslink = 1,
    deps = [":modules/nrfx/mdk/nrf_common.ld"],
    data = ["@nrf_sdk//:modules/nrfx/mdk"],
)

filegroup(
    name = "root",
    srcs = ["."],
)

exports_files(glob(["**"]))
