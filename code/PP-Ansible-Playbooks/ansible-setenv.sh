#!/bin/bash
echo ""
echo "[ansible-setenv.sh] Entered"

CURR_DIR_SETENV="$(dirname $0)"
CURR_PWD="$(pwd)"

export SERVICE_ACCOUNT_USER_NAME=providerportaluser
# Check if RUNNING_INSIDE_VM already set
if [[ -z "${RUNNING_INSIDE_VM}" ]]; then
    # RUNNING_INSIDE_VM is not set, so default to false
  export RUNNING_INSIDE_VM=false
fi

[ -d "/home/${SERVICE_ACCOUNT_USER_NAME}" ] && export PP_APP_BASE_PATH="/home/${SERVICE_ACCOUNT_USER_NAME}"
[ ! -d "/home/${SERVICE_ACCOUNT_USER_NAME}" ] && export PP_APP_BASE_PATH=${CURR_DIR_SETENV}
[ ! -d "/home/${SERVICE_ACCOUNT_USER_NAME}" ] && export SERVICE_ACCOUNT_USER_NAME=$(whoami)
[ ! -d "/home/${SERVICE_ACCOUNT_USER_NAME}" ] && export RUNNING_INSIDE_VM=false

# Check if PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH already set
if [[ -z "${PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH}" ]]; then
    # APP_RUNTIME_ENV is not set, so default to dev environment
  PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH="${CURR_DIR_SETENV}"
fi

# Check if APP_RUNTIME_ENV already set
if [[ -z "${APP_RUNTIME_ENV}" ]]; then
    # APP_RUNTIME_ENV is not set, so default to dev-local environment
  APP_RUNTIME_ENV="dev-local"
fi

# Check if APP_RUNTIME_ANSIBLE_EXTRA_ARGS already set
if [[ -z "${APP_RUNTIME_ANSIBLE_EXTRA_ARGS}" ]]; then
    # APP_RUNTIME_ANSIBLE_EXTRA_ARGS is not set, so default to blank string
  APP_RUNTIME_ANSIBLE_EXTRA_ARGS=""
fi

# Check if ANSIBLE_EXTRA_ARGS_JSON_FILE_PATH already set
if [[ -z "${ANSIBLE_EXTRA_ARGS_JSON_FILE}" ]]; then
    # ANSIBLE_EXTRA_ARGS_JSON_FILE is not set, so default to blank string
  ANSIBLE_EXTRA_ARGS_JSON_FILE="${PP_APP_BASE_PATH}/ansible-extra-args-default.json"
fi

EXTRA_ARGS="APP_RUNTIME-env=${APP_RUNTIME_ENV} ${APP_RUNTIME_ANSIBLE_EXTRA_ARGS} "

INVENTORY_FILE="${CURR_DIR_SETENV}/inventories/${APP_RUNTIME_ENV}/hosts.ini"
ANSIBLE_CONFIG_FILE="${CURR_DIR_SETENV}/ansible.cfg"

LOGS_PATH="/tmp/ansible-logs"
mkdir -p "${LOGS_PATH}"
touch "${LOGS_PATH}/provider-portal-app-ansible.log"
if [[ ${RUNNING_INSIDE_VM} ]]; then
  chmod 777 "${LOGS_PATH}/provider-portal-app-ansible.log"
else
  chmod 777 "${LOGS_PATH}/provider-portal-app-ansible.log"
fi

# Check if APP_RUNTIME_ANSIBLE_DEBUG already set
if [[ -z "${APP_RUNTIME_ANSIBLE_DEBUG}" ]]; then
    # APP_RUNTIME_ANSIBLE_DEBUG is not set, so default to true
  APP_RUNTIME_ANSIBLE_DEBUG=true
fi

if ${APP_RUNTIME_ANSIBLE_DEBUG}; then

    echo ""
    echo "######### APP_RUNTIME Ansible Configuration START #########"
    echo "APP_RUNTIME_ENV           ${APP_RUNTIME_ENV}"
    echo "PP_APP_BASE_PATH          ${PP_APP_BASE_PATH}"
    echo "CURR_PWD                  ${CURR_PWD}"
    echo "RUNNING_INSIDE_VM         ${RUNNING_INSIDE_VM}"
    echo "EXTRA_ARGS                ${EXTRA_ARGS}"
    echo "INVENTORY_FILE            ${INVENTORY_FILE}"
    echo "ANSIBLE_CONFIG_FILE       ${ANSIBLE_CONFIG_FILE}"
    echo "LOGS_PATH                 ${LOGS_PATH}"
    echo "######### APP_RUNTIME Ansible Configuration END #########"
    echo ""
fi

echo "[ansible-setenv.sh] Exiting"
echo ""
