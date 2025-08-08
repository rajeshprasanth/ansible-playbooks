# Check System Date and Time Playbook

## Purpose

This playbook retrieves and displays the current system date and time on the target hosts.

## Usage

Run the playbook specifying the target hosts:

```bash
ansible-playbook check_date.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

This playbook does not require any custom variables.

* Uses the default `target` inventory group or host list which can be overridden at runtime.

## What it does

1. Executes the `date` command on the target host to get the current date and time in `YYYY-MM-DD HH:MM:SS TZ` format.
2. Displays the retrieved date and time.

## Requirements

* The target hosts must have the `date` command available.
* The user running Ansible must have permission to execute the `date` command.

## Notes

* Fact gathering is disabled for faster execution since only a simple command is run.
* Output is plain text showing system date and time.
