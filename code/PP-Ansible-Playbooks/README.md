
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

## Update your laptop /etc/hosts

Adde following 3 lines in your laptop or computer /etc/hosts 

127.0.0.1       pp-server-kafka-local-1
127.0.0.1       pp-server-kafka-local-2
127.0.0.1       pp-server-kafka-local-3
127.0.0.1       pp-server-kafka-local-zookeeper

## Start Kafka Cluster

```sh

cd ${PP_APP_ANSIBLE_PLAYBOOKS_CODE_PATH}

./servers-kafka-multi-cluster-start.sh

./servers-kafka-multi-cluster-stop.sh 

```

