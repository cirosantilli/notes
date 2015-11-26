#!/usr/bin/env bash

awk '$2 == 2 { print $3, $1 }' posts.tmp
