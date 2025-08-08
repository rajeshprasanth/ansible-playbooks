# Ping Selected Target Hosts Playbook

## Purpose

This playbook tests connectivity to specified target hosts by using Ansible’s built-in ping module.

## Usage

Run the playbook specifying the target hosts (defaults to all hosts):

```bash
ansible-playbook check_ping.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

* `target` (optional): Host or group to ping. Defaults to `all`.
* `ping_msg`: Message displayed before pinging each host (automatically set).

## What it does

1. Displays a message indicating which host is about to be pinged.
2. Runs the Ansible ping module on the target host to verify connectivity.

## Requirements

* SSH connectivity and Python installed on target hosts.
* Ansible control node configured with inventory pointing to target hosts.

## Notes

* The Ansible ping module does not send ICMP packets; it tests connection by running Python on the remote host.
* Fact gathering is disabled for speed since it’s not required here.
