# User Manual for Ansible Playbook: Clone Git Repository

## Overview
This Ansible playbook automates the process of cloning a Git repository onto a target system. It ensures that Git is installed, creates the destination directory if it does not exist, and then clones the repository.

## Prerequisites
- Ansible installed on the control machine
- SSH access to the target machine
- The target machine must be defined in the Ansible inventory
- Git must be available in the package manager of the target machine

## Variables
- `repo_url`: The URL of the Git repository to be cloned.
- `dest_path`: The directory where the repository will be cloned.

## Playbook Structure
The playbook performs the following steps:
1. Ensures Git is installed on the target system.
2. Creates the destination directory if it does not exist.
3. Clones the specified Git repository into the destination directory.

## Running the Playbook
To execute the playbook against a specific host, use the following command:
```bash
ansible-playbook playbook.yml --limit your_target_host
```
Replace `your_target_host` with the actual hostname or group defined in the inventory.

If an inventory file is used, specify it explicitly:
```bash
ansible-playbook -i inventory.ini playbook.yml --limit your_target_host
```

## Customizing the Playbook
Modify the `vars` section in the playbook to specify a different repository URL or destination directory:
```yaml
vars:
  repo_url: "https://github.com/example/repository.git"
  dest_path: "/opt/project"
```

## Troubleshooting
- Ensure SSH connectivity to the target host.
- Verify that Git is available in the package manager (`yum`, `apt`, `dnf`, etc.).
- Check Ansible logs for errors using the `-vvv` flag for detailed output:
  ```bash
  ansible-playbook playbook.yml --limit your_target_host -vvv
  ```

## Conclusion
This playbook provides an automated way to set up and maintain Git repositories on remote systems. Adjust variables and inventory settings as needed to fit your environment.

