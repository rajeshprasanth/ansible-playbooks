# backup_docker_apps_directory

An Ansible role to back up the entire `/home/srcadm/apps` directory into a timestamped `.tar.gz` archive stored in `/opt/homelab/backup`.

---

## Features

- Creates a backup directory if it doesn't exist.
- Archives the entire source directory (`/home/srcadm/apps` by default).
- Generates backup files with timestamped names like `apps_YYYYMMDD_HHMMSS.tar.gz`.
- Source and backup destination directories are configurable via playbook variables.

---

## Directory Structure

```

roles/
└── backup\_docker\_apps\_directory/
├── tasks/
│   └── main.yml
└── vars/
└── main.yml
playbooks/
└── backup\_docker\_apps.yml

````

---

## Usage

### Running the backup with default paths

```bash
ansible-playbook playbooks/backup_docker_apps.yml
````

This will back up `/home/srcadm/apps` to `/opt/homelab/backup`.

### Overriding source and destination directories

Specify custom paths using extra vars or inside the playbook:

```bash
ansible-playbook playbooks/backup_docker_apps.yml -e "src_dir=/custom/source backup_dir=/custom/backup"
```

---

## Example playbook (`playbooks/backup_docker_apps.yml`)

```yaml
---
- name: Backup Docker apps directory
  hosts: "{{ target | default('localhost') }}"
  become: true

  vars:
    src_dir: /home/srcadm/apps
    backup_dir: /opt/homelab/backup

  roles:
    - role: backup_docker_apps_directory
      vars:
        src_dir: "{{ src_dir }}"
        backup_dir: "{{ backup_dir }}"
```

---

## Requirements

* Ansible 2.8 or later (for the `archive` module).
* Permissions to read the source directory and write to the backup directory.
* `become: true` is recommended for access to `/opt/homelab/backup`.

---

## License

This role is licensed under GPL-3.0-or-later.

---

## Author

Rajesh Prashanth Anandavadivel
