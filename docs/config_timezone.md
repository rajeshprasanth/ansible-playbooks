# Get and Set Timezone Playbook

## Purpose

This playbook retrieves the current system timezone and sets it to a desired timezone if different.

## Usage

Run the playbook with:

```bash
ansible-playbook get_set_timezone.yml -i inventory.ini -e "desired_timezone=Asia/Kolkata"
```

To target specific hosts:

```bash
ansible-playbook get_set_timezone.yml -i inventory.ini -l target_hostname
```

## Variables

| Variable           | Description                            | Default        |
| ------------------ | -------------------------------------- | -------------- |
| `desired_timezone` | The timezone to set on the target host | `Asia/Kolkata` |

## What it does

1. Uses `timedatectl` to get the current timezone of the target host.
2. If the current timezone differs from the desired one, sets the timezone accordingly using the `community.general.timezone` module.

## Requirements

* Target systems must have `timedatectl` available.
* Requires the `community.general` Ansible collection installed (`ansible-galaxy collection install community.general`).
* Privilege escalation (sudo/root) is needed to change the timezone.

## Notes

* Uses tags `get_timezone` and `set_timezone` to allow selective execution.
* Changing timezone may affect system time and scheduled tasks; proceed accordingly.
* Modify `desired_timezone` variable as per your required timezone.
