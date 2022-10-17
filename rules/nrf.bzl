""" nrf.bzl rules to build nRF5 SDK firmware """

load("@rules_cc//cc:defs.bzl", "cc_binary")

def nrf_binary(
        name,
        linker,
        sdk_srcs = [],
        sdk_includes = [],
        srcs = [],
        copts = [],
        deps = [],
        linkopts = [],
        **kwargs):
    """Compiles an executable binary for Nordic SDK based systems.

    Args:
        name: target description.
        linker: path to an .ld file or label.
        sdk_srcs: path of nRF SDK .c and .a files, relative to the SDK root.
        sdk_includes: path of nRF SDK include folders, relative to the SDK root.
        srcs: cc_binary srcs.
        copts: cc_binary copts.
        deps: cc_binary deps.
        linkopts: cc_binary linkopts.
        **kwargs: cc_binary additional arguments.
    """

    cc_binary(
        name = name,
        srcs = srcs + ["@nrf_sdk//:" + src for src in sdk_srcs],
        copts = copts + ["-I $(location @nrf_sdk//:root)/" + inc for inc in sdk_includes],
        linkopts = linkopts + ["-T$(location {})".format(linker)],
        deps = deps + [linker, "@nrf_sdk//:hdrs"],
        data = ["@nrf_sdk//:root"],
        **kwargs
    )
