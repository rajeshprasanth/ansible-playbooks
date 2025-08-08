# Check Swap Usage Playbook

## Purpose

This playbook retrieves and displays swap memory usage statistics on the target hosts.

## Usage

Run the playbook specifying the target hosts (defaults to all hosts):

```bash
ansible-playbook check_swap_usage.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

* `target` (optional): Host or group to check swap usage on. Defaults to `all`.

## What it does

1. Gathers facts from the target hosts.
2. Displays total swap memory and free swap memory in megabytes.

## Requirements

* Ansible must be able to gather facts from target hosts.
* Python installed on target hosts.

## Notes

* Swap usage information is obtained from Ansible’s built-in facts.
* Useful for monitoring swap usage on servers to identify performance issues.
