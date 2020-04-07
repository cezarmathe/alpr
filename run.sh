#!/usr/bin/env bash

ls -d */ > package-list.txt

aur build -s -v -a package-list.txt
