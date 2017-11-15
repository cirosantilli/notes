#!/usr/bin/env bash

set -ex

rm -rf *

mkdir mod
cd mod/
git init
touch a
git add a
git commit -m 1
touch b
git add b
git commit -m 2
cd ..

mkdir top
cd top
git init
touch a
git add a
git commit -m 1
touch b
git add b
git commit -m 2
git submodule add ../mod/ mod
git add .gitmodules
git commit -m '.gitmodules'
cd ..

cp -rv top top-shallow
cd top-shallow
printf '\tshallow = true\n' >> .gitmodules
git add .gitmodules
git commit -m 'shallow'
cd ..

rm -rf top2
git clone --depth 1 --recursive "file://$(pwd)/top" top2
git --git-dir top2/.git/modules/mod log
# two commits

rm -rf top2
git clone --depth 1 --recursive "file://$(pwd)/top-shallow" top2
git --git-dir top2/.git/modules/mod log
# one commit
