# Update Docker Packages on Fedora Playbook

## Purpose

This playbook updates the installed Docker Engine packages on Fedora hosts to their latest available versions and restarts the Docker service if updates occur.

## Usage

Run the playbook with:

```bash
ansible-playbook update_docker_fedora.yml -i inventory.ini -e "target=your_target_group"
```

## Variables

No additional variables required. The Docker package list is hardcoded in the playbook.

## What it does

1. Updates the Docker packages (`docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, `docker-compose-plugin`) using `dnf`.
2. Refreshes the package cache before updating.
3. Notifies the handler to restart the Docker service if any Docker packages were updated.
4. Restarts and enables the Docker service to ensure it runs with updated components.

## Requirements

* Fedora-based hosts with `dnf` package manager.
* Docker packages must already be installed.
* Sudo or root privileges.

## Notes

* This playbook does **not** install Docker packages; it only updates existing installations.
* The Docker service is restarted **only if** any Docker package is updated.
* The Docker service is enabled to start on boot if it is not already enabled.

---

If you want me to generate a similar README for any other playbook, just ask!
