#!/bin/bash -eu

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

/usr/sbin/pcscd &
sleep 2
rm -f memory.flash
cp -R "$SCRIPT_DIR/docker/fido2/"* /usr/local/lib/python3.11/dist-packages/fido2/hid
"$PROJECT_DIR/build_in_docker/pico_fido" > /dev/null &
pytest "$SCRIPT_DIR"
