# project/BUILD.bazel

load("@nRF5//rules:nrf.bzl", "nrf_binary")

package(default_visibility = ["//visibility:public"])

board_sources = select({
    "@nRF5//boards:pca10056": [
        "@nrf_sdk//:modules/nrfx/mdk/gcc_startup_nrf52840.S",
        "@nrf_sdk//:modules/nrfx/mdk/system_nrf52840.c",
    ],
    "//conditions:default": [],
})

board_defines = select({
    "@nRF5//boards:pca10056": [
        "BOARD_PCA10056",
        "NRF52840_XXAA",
    ],
    "//conditions:default": [],
})

nrf_binary(
    name = "usb_audio",
    srcs = board_sources + [
        "source/main.c",
        "config/sdk_config.h",
    ],
    copts = [
        "-O3",
        "-g3",
        "-mcpu=cortex-m4",
        "-mthumb -mabi=aapcs",
        "-Wall -Werror",
        "-mfloat-abi=hard -mfpu=fpv4-sp-d16",
        "-ffunction-sections -fdata-sections -fno-strict-aliasing",
        "-fno-builtin -fshort-enums",
    ],
    includes = [
        "config",
    ],
    linker = ":config/linker.ld",
    linkopts = [
        "-O3 -g3",
        "-mthumb -mabi=aapcs",
        "-mcpu=cortex-m4",
        "-mfloat-abi=hard -mfpu=fpv4-sp-d16",
        "-Wl,--gc-sections",
        "--specs=nano.specs",
        "-lc -lnosys -lm",
    ],
    local_defines = board_defines + [
        "APP_TIMER_V2",
        "APP_TIMER_V2_RTC1_ENABLED",
        "CONFIG_GPIO_AS_PINRESET",
        "FLOAT_ABI_HARD",
        "__HEAP_SIZE=8192",
        "__STACK_SIZE=8192",
    ],
    sdk_includes = [
        "components",
        "modules/nrfx/mdk",
        "components/libraries/scheduler",
        "components/libraries/timer",
        "components/libraries/fifo",
        "components/boards",
        "components/libraries/strerror",
        "components/toolchain/cmsis/include",
        "components/libraries/util",
        "components/libraries/bsp",
        "components/libraries/usbd/class/audio",
        "components/libraries/balloc",
        "components/libraries/ringbuf",
        "components/libraries/hardfault/nrf52",
        "modules/nrfx/hal",
        "components/libraries/hardfault",
        "components/libraries/uart",
        "components/libraries/log",
        "components/libraries/button",
        "modules/nrfx",
        "components/libraries/experimental_section_vars",
        "integration/nrfx/legacy",
        "components/libraries/usbd",
        "components/libraries/delay",
        "external/segger_rtt",
        "components/libraries/atomic_fifo",
        "components/drivers_nrf/nrf_soc_nosd",
        "components/libraries/atomic",
        "components/libraries/sortlist",
        "components/libraries/memobj",
        "integration/nrfx",
        "external/utf_converter",
        "modules/nrfx/drivers/include",
        "external/fprintf",
        "components/libraries/log/src",
    ],
    sdk_srcs = [
        "components/libraries/log/src/nrf_log_backend_rtt.c",
        "components/libraries/log/src/nrf_log_backend_serial.c",
        "components/libraries/log/src/nrf_log_backend_uart.c",
        "components/libraries/log/src/nrf_log_default_backends.c",
        "components/libraries/log/src/nrf_log_frontend.c",
        "components/libraries/log/src/nrf_log_str_formatter.c",
        "components/boards/boards.c",
        "components/libraries/button/app_button.c",
        "components/libraries/util/app_error.c",
        "components/libraries/util/app_error_handler_gcc.c",
        "components/libraries/util/app_error_weak.c",
        "components/libraries/fifo/app_fifo.c",
        "components/libraries/scheduler/app_scheduler.c",
        "components/libraries/timer/app_timer2.c",
        "components/libraries/uart/app_uart_fifo.c",
        "components/libraries/usbd/app_usbd.c",
        "components/libraries/usbd/class/audio/app_usbd_audio.c",
        "components/libraries/usbd/app_usbd_core.c",
        "components/libraries/usbd/app_usbd_string_desc.c",
        "components/libraries/util/app_util_platform.c",
        "components/libraries/timer/drv_rtc.c",
        "components/libraries/hardfault/nrf52/handler/hardfault_handler_gcc.c",
        "components/libraries/hardfault/hardfault_implementation.c",
        "components/libraries/util/nrf_assert.c",
        "components/libraries/atomic_fifo/nrf_atfifo.c",
        "components/libraries/atomic/nrf_atomic.c",
        "components/libraries/balloc/nrf_balloc.c",
        "external/fprintf/nrf_fprintf.c",
        "external/fprintf/nrf_fprintf_format.c",
        "components/libraries/memobj/nrf_memobj.c",
        "components/libraries/ringbuf/nrf_ringbuf.c",
        "components/libraries/sortlist/nrf_sortlist.c",
        "components/libraries/strerror/nrf_strerror.c",
        "integration/nrfx/legacy/nrf_drv_clock.c",
        "integration/nrfx/legacy/nrf_drv_power.c",
        "integration/nrfx/legacy/nrf_drv_uart.c",
        "components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c",
        "components/drivers_nrf/nrf_soc_nosd/nrf_soc.c",
        "modules/nrfx/soc/nrfx_atomic.c",
        "modules/nrfx/drivers/src/nrfx_clock.c",
        "modules/nrfx/drivers/src/nrfx_gpiote.c",
        "modules/nrfx/drivers/src/nrfx_power.c",
        "modules/nrfx/drivers/src/prs/nrfx_prs.c",
        "modules/nrfx/drivers/src/nrfx_systick.c",
        "modules/nrfx/drivers/src/nrfx_uart.c",
        "modules/nrfx/drivers/src/nrfx_uarte.c",
        "modules/nrfx/drivers/src/nrfx_usbd.c",
        "components/libraries/bsp/bsp.c",
        "external/segger_rtt/SEGGER_RTT.c",
        "external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c",
        "external/segger_rtt/SEGGER_RTT_printf.c",
        "external/utf_converter/utf.c",
    ],
    target_compatible_with = [
        "@nRF5//boards:pca10056",
        "@platforms//cpu:arm",
        "@platforms//os:none",
    ],
)
