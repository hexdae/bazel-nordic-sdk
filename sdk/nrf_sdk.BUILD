load("@rules_cc//cc:defs.bzl", "cc_library")

# include_globs = [
#     "components/**",
#     "modules/**",
#     "external/**",
# ]

# include_directories = [
#     "integration/nrfx",
#     "integration/nrfx/legacy",
# ]

# exclude_files = glob(
#     include_globs,
#     exclude_directories = 1,
# )

# sdk_includes = include_directories + glob(
#     include_globs,
#     exclude = exclude_files,
#     exclude_directories = 0,
# )

sdk_headers = glob(
    ["**/*.h"],
    exclude = glob(["examples/**"]),
)

include_dirs = = {header: None for header in sdk_headers}

sdk_includes = list(include_dirs.keys())

print(len(sdk_includes))

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
