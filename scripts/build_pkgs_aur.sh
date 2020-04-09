#!/usr/bin/env bash

# Sync AUR packages

source "${HOME}/.config/alppr.conf" || exit 1

PKG_LIST=$(cat ${ALPPR_SRC_DIR}/aur-package-list.txt)
printf "%s\n%s\n" "Package list:" "${PKG_LIST}"

function aur_sync() {
    local pkg_name
    pkg_name="$1"; shift

    aur sync \
        --sign \
        --chroot \
        --directory="${ALPPR_BUILD_ENV_DIR}" \
        --no-view \
        --no-confirm \
        "${pkg_name}"
}

for pkg_name in ${PKG_LIST}; do
    aur_sync "${pkg_name}"
done
