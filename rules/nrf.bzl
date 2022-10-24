""" nrf.bzl rules to build nRF5 SDK firmware """

load("@rules_cc//cc:defs.bzl", "cc_binary")

def nrf_binary(
        name,
        linker,
        deps = [],
        linkopts = [],
        **kwargs):
    """Compiles an executable binary for Nordic SDK based systems.

    Args:
        name: target description.
        linker: path to an .ld file or label.
        deps: cc_binary deps.
        linkopts: cc_binary linkopts.
        **kwargs: cc_binary additional arguments.
    """

    cc_binary(
        name = name,
        linkopts = linkopts + ["-T$(location {})".format(linker)],
        deps = deps + [linker, "@nrf_sdk//:hdrs"],
        **kwargs
    )
