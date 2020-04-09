#!/usr/bin/env bash

# Build packages from source

source "${HOME}/.config/alppr.conf" || exit 1

PKG_LIST=$(ls -d ${ALPPR_SRC_DIR}/*/)
printf "%s\n%s\n" "Package list:" "${PKG_LIST}"

function aur_build() {
    local pkg_name
    pkg_name="$1"; shift

    cd "${pkg_name}" && aur build \
        --chroot \
        --directory="${ALPPR_BUILD_ENV_DIR}" \
        --sign \
        --verify \
        -d "${ALPPR_REPO_NAME}"
}

for pkg_name in $(ls -d ${ALPPR_SRC_DIR}/*/); do
    aur_build "${pkg_name}"
done
