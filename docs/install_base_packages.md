# Install Fedora Base Packages Playbook

## Purpose

This playbook installs a predefined set of essential base packages on Fedora Linux hosts to provide common utilities and tools.

## Usage

Run the playbook with:

```bash
ansible-playbook install_base_packages.yml -i inventory.ini -e "target=your_target_group"
```

## Variables

| Variable        | Description                      | Default Packages List                                                                   |
| --------------- | -------------------------------- | --------------------------------------------------------------------------------------- |
| `base_packages` | List of base packages to install | `vim, git, curl, wget, net-tools, bash-completion, man, lsof, unzip, htop, mailx, tmux` |

## What it does

1. Installs or ensures presence of the defined base packages using the `dnf` package manager.
2. Updates the DNF package cache before installation to get the latest package metadata.

## Requirements

* Target hosts must be Fedora or compatible distributions with the `dnf` package manager.
* Sufficient privileges (sudo/root) to install packages.

## Notes

* Modify the `base_packages` list to add or remove packages as needed for your environment.
* This playbook does not upgrade existing packages; it only ensures specified packages are installed.
