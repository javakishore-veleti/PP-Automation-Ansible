
# Environment Variables In Your Laptop

```sh

export PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH=~/provider-portal/PP-Automation-Ansible/code/PP-Ansible-Playbooks

```

# Python Virtual Environment Setup

```sh

cd ${PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH}

./python-venv-setup.sh
./python-venv-activate.sh

```

# Kafka Cluster Management

## Start Kafka Cluster

```sh

cd ${PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH}

./servers-kafka-multi-cluster-start.sh

./servers-kafka-multi-cluster-stop.sh 

```

