#!/usr/bin/env bash

# Initialize the build environment

source "${HOME}/.config/alppr.conf" || exit 1

mkdir -p "${ALPPR_BUILD_ENV_DIR}"

mkarchroot "${ALPPR_BUILD_ENV_DIR}/root" base-devel git

mkdir -p "${AURDEST}"
mkdir -p "${AURDEST_SNAPSHOT}"
