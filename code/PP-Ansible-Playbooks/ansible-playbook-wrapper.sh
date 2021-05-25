#!/bin/bash
CURR_DIR="$(dirname $0)"

echo ""
echo "[ansible-playbook-wrapper.sh] Entered"

# Import the environment variables
. "${CURR_DIR}/ansible-setenv.sh"

echo "[ansible-playbook-wrapper.sh] ANSIBLE_EXTRA_ARGS_JSON_FILE ${ANSIBLE_EXTRA_ARGS_JSON_FILE}"

echo "Printing contents of ANSIBLE_EXTRA_ARGS_JSON_FILE"
cat ${ANSIBLE_EXTRA_ARGS_JSON_FILE}

echo ""
echo "--extra-vars \"${EXTRA_ARGS}\""
echo ""

# I have set this on my laptop
# export PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH=~/provider-portal/PP-Automation-Ansible/code/PP-Ansible-Playbooks

ANSIBLE_CONFIG="${ANSIBLE_CONFIG_FILE}" ansible-playbook -i "${INVENTORY_FILE}" --extra-vars "${EXTRA_ARGS}" --extra-vars "techsummit_ansible_code_path=${PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH}" --extra-vars "@$ANSIBLE_EXTRA_ARGS_JSON_FILE" $*

echo ""
echo ""
echo "[ansible-playbook-wrapper.sh] Exiting"
