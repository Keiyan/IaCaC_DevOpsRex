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

## How to deploy

1. Rename the `inventory.sample.yml` file to `inventory.yml` and fill it with your credentials
2. Run the command `ansible-playbook setup_awx.yml` from the command line.

## Layout

here is this repository layout :
```
root
|-- awx_setup # Role used to set up AWX content
|  |-- files
|  |  |-- hello_world.yml # used to craete mock playbooks during initial setup
|  |-- tasks
|  |  |-- functions
|  |  |-- main.yml
|  |  |...
|  |-- templates
|  |-- vars
|  |  |-- main.yml # Contains non secret vars
|-- awx_tests # Role used to test templates
|  |-- tasks
|  |  |-- functions
|  |  |-- main.yml
|  |  |...
|-- compose # Contains docker compose files
|-- inventory.yml # Contains secrets, not in source control (well, except for this sample repo)
|-- setup.yml # The main playbook
```
