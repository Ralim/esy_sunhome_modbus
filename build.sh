#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

TTY_FLAGS=
if [ -t 0 ] && [ -t 1 ]; then
  TTY_FLAGS="-it"
fi

podman run --rm ${TTY_FLAGS} -v "${SCRIPT_DIR}":/config:z ghcr.io/esphome/esphome compile esy_sunhome_modbus.yaml
