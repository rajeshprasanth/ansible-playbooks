# Backup Docker Volumes Playbook

## Purpose
This Ansible playbook backs up all Docker volumes on the target hosts by creating timestamped backup archives for each volume under a specified backup directory.

## Usage

Run the playbook targeting desired hosts (default is all):

```bash
ansible-playbook backup_docker_volumes.yml -i inventories/inventory.ini -e "target=your_target_group"
````

## Variables

* `backup_base_dir` (default: `/opt/homelab/backup/docker-volumes`):
  The base directory where backups are stored.

* `timestamp`:
  Current date and time in `YYYYMMDD_HHMMSS` format used to create unique backup subdirectory.

* `backup_dir`:
  Full backup directory path including the timestamp.

## What it does

1. Creates a timestamped backup directory with permissions set to `0755`.
2. Retrieves a list of all Docker volume names on the host.
3. For each Docker volume, runs a temporary Alpine container that mounts the volume and creates a compressed tarball of its contents into the backup directory.
4. Backup archives are named like `backup_volume_name.tar.gz`.

## Requirements

* Docker must be installed and running on the target hosts.
* The user running Ansible must have permission to run Docker commands.
* The `alpine` Docker image will be pulled automatically if not present.

## Notes

* Each Docker volume is backed up separately in its own archive.
* The playbook always marks the backup task as changed because archives are created every run.
* Consider scheduling cleanup or retention management of old backups separately.
