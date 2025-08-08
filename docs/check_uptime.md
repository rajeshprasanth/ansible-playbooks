# Check System Uptime Playbook

## Purpose

This playbook checks and displays the system uptime on target hosts, both as raw seconds and in a human-readable format.

## Usage

Run the playbook specifying the target hosts (defaults to all hosts):

```bash
ansible-playbook check_uptime.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

* `target` (optional): Host or group to check uptime on. Defaults to `all`.

## What it does

1. Gathers facts from the target hosts.
2. Displays system uptime in seconds using Ansible facts.
3. Runs the `uptime -p` command to get a human-readable uptime format.
4. Displays the formatted uptime output.

## Requirements

* Ansible must be able to gather facts from target hosts.
* The `uptime` command must be available on the target systems.

## Notes

* Useful for monitoring server availability and performance.
* Formatted uptime gives a user-friendly summary like "up 1 hour, 20 minutes."
