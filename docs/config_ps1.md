# Set Custom PS1 Prompt Playbook

## Purpose

This playbook sets a custom colorful Bash prompt (`PS1`) for all users by deploying a script to `/etc/profile.d/`.

## Usage

Run the playbook with:

```bash
ansible-playbook set_custom_ps1.yml -i inventory.ini
```

To target specific hosts:

```bash
ansible-playbook set_custom_ps1.yml -i inventory.ini -l target_hostname
```

## Variables

This playbook does not require any external variables.

## What it does

1. Creates or overwrites `/etc/profile.d/custom_prompt.sh` with a script that exports a custom `PS1` variable containing colored username, hostname, and working directory.
2. Ensures the script file has executable permissions (`0755`).

## Requirements

* Target hosts must support Bash and source scripts from `/etc/profile.d/`.
* Privilege escalation (sudo/root) is required to write to `/etc/profile.d/`.

## Notes

* The prompt includes colors and multi-line formatting.
* You can modify the `content` field in the playbook to customize the prompt format or colors.
* The script applies system-wide for all users upon their next login or new shell session.
