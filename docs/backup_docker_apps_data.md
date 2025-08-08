# Backup Docker Apps Data Directory Playbook

## Purpose
This Ansible playbook creates a timestamped backup archive of the Docker applications directory located at `/home/srcadm/apps`. The backup archive is saved in `/opt/homelab/backup/docker-data` on the target hosts.

## Usage

Run the playbook with the desired target hosts (default is all hosts):

```bash
ansible-playbook backup_docker_apps_data.yml -i inventories/inventory.ini -e "target=your_target_group"
````

## Variables

* `src_dir` (default: `/home/srcadm/apps`):
  The source directory containing Docker applications to be backed up.

* `backup_dir` (default: `/opt/homelab/backup/docker-data`):
  The destination directory where the compressed backup archive will be saved.

## What it does

1. Ensures the backup directory exists with proper permissions (`0755`).
2. Creates a gzipped tarball of the source directory with a timestamped filename, e.g.,
   `apps_20250808_164530.tar.gz`
3. Saves the archive in the backup directory with `0644` permissions.

## Requirements

* The `community.general` Ansible collection is required for the `archive` module.
  Install it with:

  ```bash
  ansible-galaxy collection install community.general
  ```

## Notes

* This playbook does **not** clean up old backups. Consider scheduling retention cleanup separately.
* Make sure the user running Ansible has sufficient permissions on source and destination directories.
