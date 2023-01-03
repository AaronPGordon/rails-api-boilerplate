#!/bin/bash
set -eux

ROOT=/opt/act-api-boilerplate

# for better memory management
export MALLOC_ARENA_MAX=2

cd $ROOT || true

bundle install

exec rails s
