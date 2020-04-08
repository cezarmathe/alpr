#!/usr/bin/env bash

# Initialize the local repository

source "${HOME}/.config/alppr.conf" || exit 1

printf "%s\n" "sudo install -d ${ALPPR_REPO_DIR} -o $USER"
sudo install -d "${ALPPR_REPO_DIR}" -o $USER

printf "%s\n" "repo-add ${ALPPR_REPO_DIR}/${ALPPR_REPO_NAME}"
repo-add "${ALPPR_REPO_DIR}/${ALPPR_REPO_NAME}"
