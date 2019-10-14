# Setup AWX

## Purpose

The awx_setup role aims at configuring an AWX instance so that it is fully usable. This role is not made to be ran from AWX but rather as a standalone execution during setup.

## Variables

The file awx_setup/vars/main.yml must be filled entirely before running the playbook.
You can use a playbook such as this one to run it :

```yaml
---

- hosts: localhost
  roles:
    - awx_setup
```

## Prerequisites

`pip` must be installed on the machine. The playbook needs the pyOpenSSL library, and will install it if missing.
