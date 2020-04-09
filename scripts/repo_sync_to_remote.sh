#!/usr/bin/env bash

# Sync repository to the emote

source "${HOME}/.config/alppr.conf" || exit 1

rsync -r -l --delete ${ALPPR_REPO_DIR}/ ${ALPPR_REMOTE_URI}
