load("@rules_cc//cc:defs.bzl", "cc_library")

package(default_visibility = ["//visibility:public"])

include_directories = [
    "components/**",
    "modules/**",
    "external/*",
    "integration/**",
]

exclude_files = glob(
    include_directories,
    exclude_directories = 1,
)

sdk_includes = glob(
    include_directories,
    exclude = exclude_files,
    exclude_directories = 0,
)

cc_library(
    name = "hdrs",
    hdrs = glob(["**/*.h"]),
    data = ["@nrf_sdk//:modules/nrfx/mdk"],
    includes = sdk_includes,
    linkopts = ["-L $(location @nrf_sdk//:modules/nrfx/mdk)"],
    deps = [":modules/nrfx/mdk/nrf_common.ld"],
    alwayslink = 1,
)

filegroup(
    name = "root",
    srcs = ["."],
)

exports_files(glob(["**"]))
