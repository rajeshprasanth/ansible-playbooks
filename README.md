# Ansible Home Lab Automation

This repository contains Ansible playbooks, inventories, and related files to automate provisioning, configuration, deployment, and maintenance tasks for a home lab environment.

---

## Repository Structure

```
ansible-playbooks/
├── ansible.cfg                  # Main Ansible configuration file
├── docs/                       # Documentation related to playbooks and usage
├── group_vars/                 # Group variables for inventory groups
│   ├── all.yml                 # Variables applied to all hosts
│   └── hypervisor.yml          # Variables specific to hypervisor group
├── inventories/                # Inventory files defining hosts and groups
│   └── inventory.ini           # Primary inventory file
├── LICENSE                    # License information for the playbooks repository
├── logs/                      # Directory to store Ansible logs
│   └── ansible.log             # Log file recording playbook runs and events
├── playbooks/                 # Main directory containing categorized playbooks
│   ├── backup/                # Backup and restore playbooks for Docker and databases
│   ├── cleanup/               # Playbooks for cleaning up unused packages and Docker images
│   ├── configuration/         # Playbooks to configure system settings and services
│   │   ├── files/             # Static files deployed by configuration playbooks
│   │   └── templates/         # Jinja2 templates used by configuration playbooks
│   ├── deployment/            # Playbooks for deploying files, directories, and git repositories
│   ├── installation/          # Playbooks for installing base packages and Docker on Fedora
│   ├── maintenance/           # Playbooks for updating OS, Docker, Docker images, and Zabbix agent
│   └── validation/            # Playbooks to check system health and status (CPU, memory, disk, uptime, ping, etc.)
├── README.md                  # Project overview and usage instructions
└── requirements.yml           # External Ansible roles and collections dependencies

```
---

## Usage

1. **Setup your inventory:**
   Define your hosts in the respective inventory files under `inventories/`.

2. **Run playbooks:**
   Execute playbooks using:

   ```bash
   ansible-playbook -i inventories/production/hosts.ini playbooks/provisioning/create_vms.yml
   ```

3. **Customize variables:**
   Adjust variables in `vars/global_vars.yml` or in environment/group variable files.

4. **Extend:**
   Add new playbooks under the appropriate purpose folder and follow existing naming conventions.

---

## Contributing

Feel free to fork and submit pull requests. Please follow existing code style and document your changes.

---

## License

This project is intended for personal, non-commercial use within a private home lab network.
© 2025 Rajesh Prashanth Anandavadivel.

---

## Contact

For questions or suggestions, contact:
**Rajesh Prashanth Anandavadivel**
Email: [rajeshprasanth@rediffmail.com](mailto:rajeshprasanth@rediffmail.com)
