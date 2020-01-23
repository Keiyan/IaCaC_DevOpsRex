# AWX setup playbook

## What is AWX ?

[Ansible AWX](https://www.ansible.com/products/awx-project) is the open source version of Ansible Tower. While it's the first answer you'll find on the net, it doesn't tell anything!
The base is [Ansible](https://www.ansible.com/products/engine), which is a tool to run playbooks, written in YAML, which are typically used for Infrastructure as Code. One of their key feature is idempotence.

Except that, soon, you'll have dozen of playbooks piling up, which were ran against many hosts, and now you need to build a report to tell what was the result of the last deployment for application X, including the playbook detailed result.
Enters Ansible AWX, which acts as an organizer for your infrastructure and the playbook runs.

## Purpose

This playbook allows you to fully set up Ansible AWX on a machine. It rans through these phases:
1. Use docker-compose to create AWX and gogs container
2. Setup Gogs so it will be ready to host Git repositories for playbooks
3. Fill AWX using the awx_setup role
4. Eventually switch to current user development branch

## Prequisites

- Ansible
- Python
- pip
- Docker
- Docker-compose
- Kubernetes
- Helm

## How to deploy

1. Unpack the Templates_dor.7z file so that is is at the same level of the IaCaC_DevOpsRex directory
2. Run the command `ansible-playbook k8s_local_init.yml` to set up your local kubernetes cluster
3. Rename the `inventory.sample.yml` file to `inventory.yml` and fill it with your credentials
4. Run the command `ansible-playbook setup_awx.yml` from the command line.

## Layout

here is this repository layout :
```
root
|-- awx_chart # Helm chart used to create containers
|-- azure_yaml # deployment logic for Azure DevOps
|-- fill_awx # Role used to set up AWX content
|  |-- tasks
|  |  |-- functions
|  |  |-- main.yml
|  |  |...
|  |-- templates
|  |-- vars
|  |  |-- main.yml # Contains non secret vars
|-- git # Role used to push templates and roles to GOGS
|-- gogs # Role used to build GOGS and initialize it
|-- kubernetes # Role used to run helm chart and create containers
|-- setup_awx # Role used for initial setup of AWX
|-- tests # Role used to test templates
|  |-- tasks
|  |  |-- functions
|  |  |-- main.yml
|  |  |...
|-- azure-pipelins.yml # contains deployment logic
|-- inventory.yml # Contains secrets, not in source control (well, except for this sample repo)
|-- setup_awx.yml # The main playbook
```
