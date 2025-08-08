# Restore Docker Volume Playbook

## Purpose

This playbook restores a specific Docker volume from a timestamped `.tar.gz` backup file.  
It ensures the target volume exists and then restores its contents using an Alpine container.

## Usage

Run the playbook using the `ansible-playbook` command:

```bash
ansible-playbook restore_docker_volume.yml \
  -e "restore_timestamp=20250808_143055 volume_name=myvolume" \
  -l <target_host>
````

Alternatively, override variables in an inventory or vars file.

## Variables

| Variable            | Description                                                  | Default                                            |
| ------------------- | ------------------------------------------------------------ | -------------------------------------------------- |
| `backup_base_dir`   | Base directory containing all Docker volume backups          | `/opt/homelab/backup/docker-volumes`               |
| `restore_timestamp` | Timestamp folder to restore from (format: `YYYYMMDD_HHMMSS`) | `"20250808_143055"`                                |
| `volume_name`       | Name of the Docker volume to restore                         | `"myvolume"`                                       |
| `backup_dir`        | Derived path to backup directory                             | `{{ backup_base_dir }}/{{ restore_timestamp }}`    |
| `backup_file`       | Full path to backup archive                                  | `{{ backup_dir }}/backup_{{ volume_name }}.tar.gz` |

## What it does

1. Verifies the backup archive exists for the given volume and timestamp.
2. Fails early if the backup file is missing.
3. Creates the specified Docker volume if it doesn't exist.
4. Uses an Alpine container to untar the archive directly into the Docker volume.

## Requirements

* Ansible ≥ 2.9
* Docker installed and running on the target host
* The backup archive must have been created in the expected format:
  `backup_<volume_name>.tar.gz` inside a timestamped directory.
* `alpine` Docker image (pulled automatically if not available)

## Notes

* The playbook uses a `docker run` with a `--rm` Alpine container to restore the volume.
* It assumes the archive contains a flat structure ready to be extracted into the Docker volume.
* Existing volume data **will be overwritten** by the restore.
* Make sure `restore_timestamp` and `volume_name` match the backup you intend to restore.
