# Update OS with Pre-Update Package Snapshot Playbook

## Purpose

This playbook performs a system OS update on target hosts while:

* Taking a snapshot of currently installed packages before the update,
* Saving the package list with a timestamp for future reference,
* Running a full system upgrade using `dnf upgrade -y`,
* Optionally rebooting the host if the kernel package was updated.

## Usage

Run the playbook specifying your target hosts:

```bash
ansible-playbook update_os.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

* `package_snapshot_dir` (default: `/opt/homelab/os-update`): Directory where the installed package list snapshot file will be saved.
* `snapshot_timestamp`: Automatically generated timestamp in `YYYYMMDD_HHMMSS` format, used to name the snapshot file.

## What it does

1. Ensures the snapshot directory exists with proper permissions (`0755`).
2. Generates a current timestamp for naming the snapshot file.
3. Gathers installed package facts using Ansible's package\_facts module.
4. Creates a sorted list of installed package names.
5. Saves the list to a timestamped `.dat` file in the snapshot directory.
6. Runs `dnf upgrade -y` to update all packages on the system.
7. Checks if the `kernel` package was in the installed package list and triggers a reboot if so, to apply kernel updates safely.

## Requirements

* The target hosts must use a package manager supported by `ansible.builtin.package_facts` (e.g., dnf/yum).
* Sudo/root privileges on the target hosts.
* `dnf` package manager for upgrades.
* Proper Ansible setup to gather facts (`gather_facts: true`).

## Notes

* The package snapshot is useful for auditing or rollback planning.
* The reboot task is conditional; adjust logic if your environment requires different handling.
* The update task checks `dnf` output for "Complete!" to determine if changes occurred.
* Modify `package_snapshot_dir` if you want snapshots stored elsewhere.
* This playbook assumes a Fedora/RHEL-like OS with `dnf`.

---

If you want me to generate README for other playbooks or tweak this, just ask!
