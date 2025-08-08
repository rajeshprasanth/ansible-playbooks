# Check CPU Utilization Playbook

## Purpose

This playbook retrieves the current CPU utilization percentage on the target hosts by parsing the output of the `top` command.

## Usage

Run the playbook specifying the target hosts:

```bash
ansible-playbook check_cpu_util.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

This playbook does not require any custom variables.

* Uses the default `target` inventory group or host list which can be overridden at runtime.

## What it does

1. Runs the `top` command in batch mode to get a snapshot of CPU usage.
2. Extracts the CPU usage line containing percentage usage.
3. Displays the CPU utilization information as plain text.

## Requirements

* The target hosts must have the `top` command available.
* The user running Ansible must have permission to execute `top`.

## Notes

* The output is raw and may need parsing if you want to extract specific CPU metrics.
* This playbook disables fact gathering for faster execution.
