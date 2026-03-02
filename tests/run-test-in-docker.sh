#!/bin/bash -eu

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/docker_env.sh"
run_in_docker "$SCRIPT_DIR/start-up-and-test.sh"

