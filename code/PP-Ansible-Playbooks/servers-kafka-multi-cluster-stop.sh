SCRIPT_CURR_DIR="$(dirname $0)"

sh ${SCRIPT_CURR_DIR}/ansible-playbook-wrapper.sh ${SCRIPT_CURR_DIR}/playbooks/streams/kafka/Multi-Broker-Docker-Compose-Stop-pb.yml
