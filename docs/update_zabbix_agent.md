# Update Zabbix Agent Playbook

## Purpose

This playbook stops the Zabbix Agent service on target RHEL/Fedora hosts, updates the `zabbix-agent` package to the latest available version, then restarts and enables the service.

## Usage

Run the playbook specifying your target hosts:

```bash
ansible-playbook update_zabbix_agent.yml -i inventories/inventory.ini -e "target=your_target_group"
```

## Variables

This playbook does not require extra variables. It assumes:

* The `zabbix-agent` package is installed on the target hosts.
* The `zabbix-agent` service is named `zabbix-agent`.

You can override the `target` inventory group or host list at runtime.

## What it does

1. Stops the `zabbix-agent` service to allow safe upgrade.
2. Refreshes the package metadata cache using `dnf`.
3. Upgrades the `zabbix-agent` package specifically.
4. Starts and enables the `zabbix-agent` service after the upgrade.

## Requirements

* Target hosts must be running RHEL, Fedora, or compatible distributions using `dnf`.
* The playbook must run with sufficient privileges to stop/start services and update packages.
* The `zabbix-agent` package must already be installed on the hosts.

## Notes

* The upgrade uses `dnf upgrade -y zabbix-agent` to update only the Zabbix Agent package.
* Service is enabled to start automatically on boot.
* The upgrade task considers the command successful if the output contains "Upgraded:" or the command exits with code 0.
* This playbook can be extended to upgrade multiple packages if needed.
