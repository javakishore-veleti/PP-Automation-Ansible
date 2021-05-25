#!/bin/bash
echo ""
echo "[ansible-wrapper.sh] Entered"

CURR_DIR="$(dirname $0)"

# Import the environment variables
. "${CURR_DIR}/ansible-setenv.sh"

ANSIBLE_CONFIG="${ANSIBLE_CONFIG_FILE}" ansible -i "${INVENTORY_FILE}"  --extra-vars="\"${EXTRA_ARGS}\""  $*

echo ""
echo "[ansible-wrapper.sh] Exiting"
echo ""