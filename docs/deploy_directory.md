# Deploy Local Directory to Remote Directory Playbook

## Purpose

This playbook copies a local directory from the control machine to a specified directory on remote target hosts, preserving ownership and permissions.

## Usage

Run the playbook with:

```bash
ansible-playbook deploy_directory.yml -i inventory.ini -e "target=your_target_group local_dir=./local_directory remote_dir=/opt/remote_directory"
```

## Variables

| Variable     | Description                              | Default                 |
| ------------ | ---------------------------------------- | ----------------------- |
| `local_dir`  | Path to the local directory to copy      | `./local_directory`     |
| `remote_dir` | Destination directory on the remote host | `/opt/remote_directory` |

## What it does

1. Copies all files and subdirectories recursively from the specified local directory to the target remote directory.
2. Sets ownership of copied files to `root:root`.
3. Sets file permissions to `0755` and directory permissions to `0755`.

## Requirements

* The Ansible control machine must have access to the local directory.
* Target hosts must allow privilege escalation (sudo/root) to write to the destination directory.

## Notes

* Trailing slashes on `src` and `dest` are important to ensure correct copying behavior.
* Adjust `owner`, `group`, and permissions as needed to fit your environment.
* If the target directory does not exist, it will be created.
