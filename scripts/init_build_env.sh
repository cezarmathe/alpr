#!/usr/bin/env bash

# Initialize the build environment

source "${HOME}/.config/alppr.conf" || exit 1

mkarchroot "${ALPPR_BUILD_ENV_DIR}/root" base-devel git
