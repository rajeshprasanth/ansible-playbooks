# Deploy Single Local File to Remote Directory Playbook

## Purpose

This playbook copies a single local file from the control machine to a specified path on remote target hosts, setting ownership and permissions.

## Usage

Run the playbook with:

```bash
ansible-playbook deploy_file.yml -i inventory.ini -e "target=your_target_group local_file=./myfile.txt remote_path=/opt/remote_directory/myfile.txt"
```

## Variables

| Variable      | Description                                   | Default                            |
| ------------- | --------------------------------------------- | ---------------------------------- |
| `local_file`  | Path to the local file to copy                | `./myfile.txt`                     |
| `remote_path` | Full destination file path on the remote host | `/opt/remote_directory/myfile.txt` |

## What it does

1. Copies the specified local file to the target remote path.
2. Sets the file ownership to `root:root`.
3. Sets the file permission mode to `0644`.

## Requirements

* The Ansible control machine must have access to the local file.
* Target hosts must allow privilege escalation (sudo/root) to write to the destination path.

## Notes

* Ensure the parent directory of `remote_path` exists on the remote host or the copy task will fail.
* Adjust ownership and permissions as needed for your environment.
