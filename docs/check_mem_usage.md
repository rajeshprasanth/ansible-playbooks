# Check Memory Usage Playbook

## Purpose

This playbook gathers and displays the current memory usage statistics of the target hosts.

## Usage

Run the playbook specifying your target hosts:

```bash
ansible-playbook check_mem_usage.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

No user-configurable variables are required for this playbook.

## What it does

1. Gathers facts from the target host(s), including memory details.
2. Displays total, free, and used memory in megabytes (MB).

## Requirements

* Fact gathering enabled (`gather_facts: true`) to collect memory stats.
* The managed hosts must support Ansible fact gathering (usually any Linux system).

## Notes

* If `memused_mb` fact is not available, the playbook calculates used memory by subtracting free memory from total memory.
* Output is shown as a debug message for easy readability.
