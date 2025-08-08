# Cleanup Docker Images Playbook

## Purpose

This playbook helps clean up unused Docker images on the target hosts by removing dangling images or optionally all unused images.

## Usage

Run the playbook with:

```bash
ansible-playbook cleanup_docker_images.yml -i inventory.ini
```

To target specific hosts:

```bash
ansible-playbook cleanup_docker_images.yml -i inventory.ini -l target_hostname
```

## Variables

This playbook does not require any external variables.

## What it does

1. Removes dangling Docker images using `docker image prune -f`.
2. Optionally, can remove **all** unused Docker images using `docker image prune -a -f`.
   (This task is commented by default; uncomment to enable.)

## Requirements

* Docker must be installed and running on target hosts.
* Ansible user must have permission to run Docker commands (typically root or a user in the `docker` group).
* Ansible 2.9+ recommended.

## Notes

* Removing dangling images only deletes images not referenced by any container.
* Removing all unused images (`-a` flag) may delete images still in use by stopped containers — use with caution.
* Modify the playbook to comment/uncomment the appropriate task based on your cleanup preference.
