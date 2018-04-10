#!/usr/bin/env bash

ROOT_DIR=$(cd $(dirname $0)/..; pwd)

# Load .env
export $(cat "${ROOT_DIR}/.env" | grep -v "^#" | grep -v -e "^$"  | xargs)

# Sync files
rsync \
  -avh \
  --delete \
  --stats \
  --progress \
  --exclude '.*' \
  --exclude '*.md' \
  --exclude 'script' \
  ${ROOT_DIR}/ \
  -e ssh ${WWW_HOST}:${WWW_PATH}
