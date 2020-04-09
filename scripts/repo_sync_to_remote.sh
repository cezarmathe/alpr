#!/usr/bin/env bash

# Sync repository to the emote

rsync -r -l --delete "${ALPPR_REPO_DIR}/" "${ALPPR_REMOTE_URI}"
