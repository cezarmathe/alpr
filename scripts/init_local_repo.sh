#!/usr/bin/env

### Initialize the local repository

source "${HOME}/.config/alppr.conf" || exit 1

sudo install -d "${ALPPR_REPO_DIR}" -o $USER
repo-add "${ALPPR_REPO_DIR}"
