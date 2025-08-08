# Manage Cockpit Files and Deploy login\_info Script Playbook

## Purpose

This playbook cleans up the Cockpit MOTD directory and deploys a custom `login_info.sh` script to display login information on user shell sessions.

## Usage

Run the playbook with:

```bash
ansible-playbook manage_cockpit_files.yml -i inventory.ini
```

To target specific hosts:

```bash
ansible-playbook manage_cockpit_files.yml -i inventory.ini -l target_hostname
```

## Variables

| Variable               | Description                                      | Default                        |
| ---------------------- | ------------------------------------------------ | ------------------------------ |
| `cockpit_motd_path`    | Path to the Cockpit MOTD directory to remove     | `/etc/motd.d/cockpit`          |
| `cockpit_profile_dest` | Destination path for the login info script       | `/etc/profile.d/login_info.sh` |
| `cockpit_profile_src`  | Source path (relative to playbook) of the script | `files/login_info.sh`          |

## What it does

1. Removes the `/etc/motd.d/cockpit` directory if it exists (cleanup).
2. Copies the `login_info.sh` script to `/etc/profile.d/` with executable permissions (`0755`), so it runs at user login.

## Requirements

* Target hosts must allow privilege escalation (sudo/root).
* The `login_info.sh` script must be present in the `files/` directory relative to the playbook.

## Notes

* The playbook uses tags `cleanup` for removal and `deploy` for the copy task, enabling selective execution if desired.
* Adjust the source script path if your directory structure differs.
* Ensure the `login_info.sh` script is well-tested to avoid login issues.
