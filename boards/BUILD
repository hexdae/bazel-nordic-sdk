# config/BUILD

package(default_visibility = ["//visibility:public"])

constraint_setting(name = "board")

constraint_value(
    name = "pca10040",
    constraint_setting = ":board",
)

constraint_value(
    name = "pca10056",
    constraint_setting = ":board",
)

constraint_value(
    name = "pca10100",
    constraint_setting = ":board",
)

config_setting(
    name = "is_pca10040",
    constraint_values = [
        ":pca10040",
    ],
)

config_setting(
    name = "is_pca10056",
    constraint_values = [
        ":pca10056",
    ],
)

config_setting(
    name = "is_pca10100",
    constraint_values = [
        ":pca10100",
    ],
)
