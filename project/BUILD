# project/BUILD.bazel

load("//rules:nrf.bzl", "nrf_binary")

board_sources = select({
    "//config:pca10040": [
        "@nrf_sdk//:modules/nrfx/mdk/gcc_startup_nrf52.S",
        "@nrf_sdk//:modules/nrfx/mdk/system_nrf52.c",
    ],
    "//config:pca10056": [
        "@nrf_sdk//:modules/nrfx/mdk/gcc_startup_nrf52840.S",
        "@nrf_sdk//:modules/nrfx/mdk/system_nrf52840.c",
    ],
    "//config:pca10100": [
        "@nrf_sdk//:modules/nrfx/mdk/gcc_startup_nrf52833.S",
        "@nrf_sdk//:modules/nrfx/mdk/system_nrf52833.c",
    ],
})

board_defines = select({
    "//config:pca10040": [
        "BOARD_PCA10040",
        "NRF52832_XXAA",
        "NRF52",
        "NRF52_PAN_74",
    ],
    "//config:pca10056": [
        "BOARD_PCA10056",
        "NRF52840_XXAA",
    ],
    "//config:pca10100": [
        "BOARD_PCA10100",
        "NRF52833_XXAA",
    ],
})

nrf_binary(
    name = "wake_on_nfc",
    srcs = board_sources + [
        "source/main.c",
        "config/sdk_config.h",
        "@nrf_sdk//:components/boards/boards.c",
        "@nrf_sdk//:components/drivers_nrf/nrf_soc_nosd/nrf_nvic.c",
        "@nrf_sdk//:components/drivers_nrf/nrf_soc_nosd/nrf_soc.c",
        "@nrf_sdk//:components/libraries/atomic/nrf_atomic.c",
        "@nrf_sdk//:components/libraries/atomic_fifo/nrf_atfifo.c",
        "@nrf_sdk//:components/libraries/balloc/nrf_balloc.c",
        "@nrf_sdk//:components/libraries/bsp/bsp.c",
        "@nrf_sdk//:components/libraries/bsp/bsp_nfc.c",
        "@nrf_sdk//:components/libraries/button/app_button.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_backend_rtt.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_backend_serial.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_backend_uart.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_default_backends.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_frontend.c",
        "@nrf_sdk//:components/libraries/log/src/nrf_log_str_formatter.c",
        "@nrf_sdk//:components/libraries/memobj/nrf_memobj.c",
        "@nrf_sdk//:components/libraries/ringbuf/nrf_ringbuf.c",
        "@nrf_sdk//:components/libraries/scheduler/app_scheduler.c",
        "@nrf_sdk//:components/libraries/sortlist/nrf_sortlist.c",
        "@nrf_sdk//:components/libraries/strerror/nrf_strerror.c",
        "@nrf_sdk//:components/libraries/timer/app_timer2.c",
        "@nrf_sdk//:components/libraries/timer/drv_rtc.c",
        "@nrf_sdk//:components/libraries/util/app_error.c",
        "@nrf_sdk//:components/libraries/util/app_error_handler_gcc.c",
        "@nrf_sdk//:components/libraries/util/app_error_weak.c",
        "@nrf_sdk//:components/libraries/util/app_util_platform.c",
        "@nrf_sdk//:components/libraries/util/nrf_assert.c",
        "@nrf_sdk//:external/fprintf/nrf_fprintf.c",
        "@nrf_sdk//:external/fprintf/nrf_fprintf_format.c",
        "@nrf_sdk//:external/segger_rtt/SEGGER_RTT.c",
        "@nrf_sdk//:external/segger_rtt/SEGGER_RTT_Syscalls_GCC.c",
        "@nrf_sdk//:external/segger_rtt/SEGGER_RTT_printf.c",
        "@nrf_sdk//:integration/nrfx/legacy/nrf_drv_clock.c",
        "@nrf_sdk//:integration/nrfx/legacy/nrf_drv_uart.c",
        "@nrf_sdk//:modules/nrfx/drivers/src/nrfx_clock.c",
        "@nrf_sdk//:modules/nrfx/drivers/src/nrfx_gpiote.c",
        "@nrf_sdk//:modules/nrfx/drivers/src/nrfx_uart.c",
        "@nrf_sdk//:modules/nrfx/drivers/src/nrfx_uarte.c",
        "@nrf_sdk//:modules/nrfx/drivers/src/prs/nrfx_prs.c",
        "@nrf_sdk//:modules/nrfx/soc/nrfx_atomic.c",
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
    includes = ["config"],
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
)
