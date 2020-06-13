""" nrf.bzl rules to build nRF5 SDK firmware """

load("@rules_cc//cc:defs.bzl", "cc_binary")

def nrf_binary(
        name = None,
        linker = None,
        sdk_srcs = [],
        sdk_includes = [],
        srcs = [],
        copts = [],
        deps = [],
        linkopts = [],
        **kwargs):
    """nrf_binary"""

    if name == None:
        name = native.package_name().split("/")[-1]

    if linker == None:
        fail("Define a linker script for {}: linker = \"path/to/linker.ld\", ".format(name))

    cc_binary(
        name = name + "_out",
        srcs = srcs + ["@nrf_sdk//:" + src for src in sdk_srcs],
        # copts = copts + ["-I external/nrf_sdk/" + inc for inc in sdk_includes],
        copts = copts + ["-I $(rootpath @nrf_sdk//:root)/" + inc for inc in sdk_includes],
        linkopts = linkopts + ["-T$(rootpath {})".format(linker)],
        deps = deps + [linker, "@nrf_sdk//:hdrs"],
        data = ["@nrf_sdk//:root"],
        **kwargs
    )

    native.genrule(
        name = name + "_bin",
        srcs = [":" + name + "_out"],
        outs = [name + ".bin"],
        cmd = "$(execpath @arm_none_eabi//:objcopy) -O binary $< $@",
        tools = ["@arm_none_eabi//:objcopy"],
    )

    native.genrule(
        name = name + "_hex",
        srcs = [":" + name + "_out"],
        outs = [name + ".hex"],
        cmd = "$(execpath @arm_none_eabi//:objcopy) -O ihex $< $@",
        tools = ["@arm_none_eabi//:objcopy"],
    )

    native.filegroup(
        name = name,
        srcs = [
            name + "_out",
            name + "_bin",
            name + "_hex",
        ],
    )
