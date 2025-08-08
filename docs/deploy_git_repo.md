Here’s a `README.md` for your **Deploy Remote Git Repository** playbook:

---

# Deploy Remote Git Repository Playbook

## Purpose

This playbook clones or updates a remote Git repository on the target hosts, ensuring the specified version (branch, tag, or commit) is checked out.

## Usage

Run the playbook with:

```bash
ansible-playbook deploy_git_repo.yml -i inventory.ini -e "target=your_target_group repo_url=https://github.com/user/repo.git dest_path=/opt/myrepo repo_version=main"
```

## Variables

| Variable       | Description                                      | Default                            |
| -------------- | ------------------------------------------------ | ---------------------------------- |
| `repo_url`     | URL of the Git repository to clone or update     | `https://github.com/user/repo.git` |
| `dest_path`    | Destination path on the remote host for the repo | `/opt/myrepo`                      |
| `repo_version` | Git branch, tag, or commit to check out          | `main`                             |

## What it does

1. Clones the specified Git repository if not already present at the destination.
2. Updates the repository to the specified version (branch, tag, or commit).
3. Forces checkout to overwrite any local changes.
4. Automatically accepts the SSH host key if prompted (for SSH URLs).

## Requirements

* `git` must be installed on the remote hosts.
* Target hosts must have network access to the Git repository URL.
* Proper permissions to write to the destination directory.
* Privilege escalation (sudo/root) if required for destination directory access.

## Notes

* The `force: true` option will discard local changes if any exist.
* For private repositories, additional SSH key or authentication setup may be required.
