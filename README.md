# Ansible Home Lab Automation

This repository contains Ansible playbooks, inventories, and related files to automate provisioning, configuration, deployment, and maintenance tasks for a home lab environment.

---

## Repository Structure

```
ansible-playbooks/
├── inventories/               # Host inventory files
├── playbooks/                 # Playbooks organized by purpose
│   ├── provisioning/          # Create and configure infrastructure components
│   ├── configuration/         # OS and network configuration tasks
│   ├── application_setup/     # Install and configure applications and services
│   ├── deployment/            # Deployment and update workflows
│   ├── orchestration/         # Multi-host orchestration tasks
│   ├── monitoring_logging/    # Monitoring and logging setup
│   ├── security/              # Security hardening and firewall setup
│   ├── backup_restore/        # Backup and restore operations
│   ├── maintenance/           # System maintenance and housekeeping
│   └── validation_testing/    # Post-deployment validation and tests
├── roles/                    # Reusable Ansible roles (optional)
├── templates/                # Jinja2 templates used by playbooks
├── files/                    # Static files copied by playbooks
├── vars/                     # Variable files
├── ansible.cfg               # Ansible configuration file
├── requirements.yml          # External dependencies and roles
├── README.md                 # This documentation
└── .gitignore                # Git ignore rules

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
