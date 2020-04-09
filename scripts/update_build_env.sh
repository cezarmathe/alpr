#!/usr/bin/env bash

# Update the build environment

source "${HOME}/.config/alppr.conf" || exit 1

arch-nspawn "${ALPPR_BUILD_ENV_DIR}/root" pacman -Syu
