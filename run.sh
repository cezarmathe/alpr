#!/usr/bin/env bash

ls -d src/*/ > package-list.tmp

aur build -s -v -a package-list.tmp

rm package-list.tmp

aur sync $(cat aur-package-list.txt)
