# Cleanup DNF Cache Playbook

## Purpose

This Ansible playbook automates the cleanup of cached metadata and packages from the DNF package manager, and removes unused dependencies on target Fedora or RHEL-based systems.

## Usage

Run the playbook with:

```bash
ansible-playbook cleanup_dnf_cache.yml -i inventory.yml
```

You can also limit execution to specific hosts with:

```bash
ansible-playbook cleanup_dnf_cache.yml -i inventory.yml -l target_hostname
```

## Variables

This playbook does not require any custom variables.

## What it does

1. Executes `dnf clean all` to remove cached repository metadata and package data.
2. Executes `dnf autoremove -y` to remove unused packages and dependencies.

## Requirements

* Ansible 2.10+
* Target systems should be Fedora, RHEL, CentOS, or other DNF-based distributions.
* SSH access with privilege escalation (sudo/root).

## Notes

* `dnf clean all` is set with `changed_when: false` as it does not change system state in a detectable way.
* `dnf autoremove -y` may remove packages depending on current system state.
* Ensure a backup or snapshot is available before running this in production environments, especially when using `autoremove`.
