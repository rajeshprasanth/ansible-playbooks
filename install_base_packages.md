# User Manual for Ansible Playbook: Install Essential Packages on Fedora

## Overview
This Ansible playbook automates the installation of essential packages (`htop`, `mailx`, and `git`) on Fedora-based systems. It ensures that the package repository is updated before installing the required software.

## Prerequisites
- Ansible installed on the control machine.
- SSH access to the target machines.
- Target machines must be Fedora-based.
- Sudo privileges on the target machines.

## Playbook Structure
The playbook executes the following tasks:
1. Updates the package repository to ensure the latest package versions are available.
2. Installs `htop`, `mailx`, and `git` in a single task for efficiency.

## Running the Playbook
To execute the playbook against all hosts:
```bash
ansible-playbook install_base_packages.yml
```

To run it against a specific host or group:
```bash
ansible-playbook install_base_packages.yml --limit your_target_host
```
Replace `your_target_host` with the actual hostname or group defined in your inventory.

If using a custom inventory file, specify it explicitly:
```bash
ansible-playbook -i inventory.ini install_base_packages.yml
```

## Customization
If additional packages are needed, modify the `name` list in the playbook:
```yaml
- name: Install essential packages
  ansible.builtin.dnf:
    name:
      - htop
      - mailx
      - git
      - vim  # Example additional package
    state: present
```

## Troubleshooting
- **SSH connectivity issues**: Ensure the target machine is accessible via SSH.
- **Sudo permissions**: Verify the user running Ansible has `sudo` privileges on the target machine.
- **Package manager issues**: If installation fails, manually check `dnf` on the target machine:
  ```bash
  sudo dnf update -y
  sudo dnf install htop mailx git -y
  ```

## Conclusion
This playbook provides an automated way to install essential packages on Fedora. Modify the package list as needed to fit your requirements.

