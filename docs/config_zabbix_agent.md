Here’s a `README.md` for your **Configure Zabbix Agent** playbook:

---

# Configure Zabbix Agent Playbook

## Purpose

This playbook configures the Zabbix Agent on target hosts by backing up the existing configuration, deploying a templated config file, and restarting the agent service.

## Usage

Run the playbook with:

```bash
ansible-playbook configure_zabbix_agent.yml -i inventory.ini -e "target=your_target_group zabbix_server_name=monitoring.example.com"
```

## Variables

| Variable                   | Description                                    | Default                              |
| -------------------------- | ---------------------------------------------- | ------------------------------------ |
| `zabbix_agent_config_path` | Path to the Zabbix agent config file           | `/etc/zabbix/zabbix_agentd.conf`     |
| `zabbix_agent_backup_path` | Path to backup the existing config             | `/etc/zabbix/zabbix_agentd.conf.bak` |
| `zabbix_agent_service`     | Name of the Zabbix agent service               | `zabbix-agent`                       |
| `zabbix_server_name`       | Hostname or IP of the Zabbix server to monitor | `monitoring.example.com`             |
| `zabbix_agent_name`        | Hostname used as the agent name in config      | Defaults to the inventory hostname   |

## What it does

1. Gathers installed package facts to confirm Zabbix agent installation.
2. Fails the play if Zabbix agent is not installed on the target host.
3. Backs up the current Zabbix agent configuration file.
4. Stops the Zabbix agent service.
5. Deploys a new `zabbix_agentd.conf` configuration file from a Jinja2 template.
6. Starts the Zabbix agent service.

## Requirements

* Zabbix agent must be installed on the target hosts.
* The template file `templates/zabbix_agentd.conf.j2` must exist relative to the playbook.
* Privilege escalation (sudo/root) is required to modify config files and manage services.

## Notes

* The backup of the original config file is created with `.bak` extension before changes.
* Modify the `zabbix_agentd.conf.j2` template to suit your environment and monitoring needs.
* The playbook expects Ansible 2.9+ for `package_facts` and other modules used.
