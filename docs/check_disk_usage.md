# Check Disk Usage Playbook

## Purpose

This playbook retrieves and displays disk usage statistics on the target hosts, including a total summary.

## Usage

Run the playbook specifying the target hosts:

```bash
ansible-playbook check_disk_usage.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

This playbook does not require any custom variables.

* Uses the default `target` inventory group or host list which can be overridden at runtime.

## What it does

1. Runs the `df -h --total` command on the target hosts to get disk usage in human-readable format with a total summary.
2. Displays the output of the disk usage report.

## Requirements

* The target hosts must have the `df` command available.
* The user running Ansible must have permission to execute the `df` command.

## Notes

* Fact gathering is disabled to improve execution speed.
* Output shows mounted filesystem usage, size, used, available space, and usage percentage.
