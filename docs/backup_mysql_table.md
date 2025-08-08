# Backup MySQL Table Playbook

## Purpose
This playbook performs a logical backup of a specific table from a MySQL database on the target host, saving it as a timestamped `.sql` file.

## Usage

Run the playbook specifying the target hosts and override MySQL connection and table variables as needed:

```bash
ansible-playbook backup_mysql_table.yml -i inventories/inventory.ini -e "target=your_target_group mysql_password=your_password mysql_database=your_db mysql_table=your_table"
````

## Variables

* `mysql_user` (default: `root`): MySQL username with dump privileges.
* `mysql_password` (required): Password for the MySQL user.
* `mysql_host` (default: `localhost`): MySQL server hostname.
* `mysql_database` (required): Database containing the table to back up.
* `mysql_table` (required): Table to back up.
* `backup_dir` (default: `/opt/homelab/backup/mysql`): Directory where backup files are saved.
* `timestamp`: Current timestamp in `YYYYMMDD_HHMMSS` format.
* `backup_file`: Full path to the generated table backup file.

## What it does

1. Ensures the backup directory exists with `0755` permissions.
2. Dumps the specified table to a `.sql` file using `mysqldump`.
3. Verifies that the backup file was successfully created.
4. Fails the play if the backup file is missing.

## Requirements

* `mysqldump` must be installed on the target host.
* The MySQL user must have permission to dump the specified table.
* The playbook masks password logs using `no_log: true`.

## Notes

* Protect backups securely as they contain sensitive data.
* Manage retention or cleanup of backups externally.
* Modify variables as needed to suit different environments.
