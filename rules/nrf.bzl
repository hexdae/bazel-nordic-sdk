""" nrf.bzl rules to build nRF5 SDK firmware """

load("@rules_cc//cc:defs.bzl", "cc_binary")

def nrf_binary(name, linker, deps = [], linkopts = [], **kwargs):
    """nrf_binary"""

    cc_binary(
        name = name + "_out",
        linkopts = linkopts + ["-T$(rootpath {})".format(linker)],
        deps = deps + [linker, "@nrf_sdk//:hdrs"],
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
