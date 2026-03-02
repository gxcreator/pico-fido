#!/bin/bash -eu

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/.."

source "$SCRIPT_DIR/docker_env.sh"
#run_in_docker rm -rf CMakeFiles
run_in_docker mkdir -p "$PROJECT_DIR/build_in_docker"
run_in_docker -w "$PROJECT_DIR/build_in_docker" cmake -DENABLE_EMULATION=1 "$PROJECT_DIR"
run_in_docker -w "$PROJECT_DIR/build_in_docker" make -j ${NUM_PROC}
