#!/usr/bin/env bash

# Initialize the build environment

source "${HOME}/.config/alppr.conf" || exit 1

printf "%s\n" "aur chroot --directory="${ALPPR_BUILD_ENV_DIR}" --no-build"
aur chroot --directory="${ALPPR_BUILD_ENV_DIR}" --no-build
