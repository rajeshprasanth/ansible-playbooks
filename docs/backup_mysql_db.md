# Backup MySQL Database Playbook

## Purpose
This Ansible playbook creates a logical backup of a specified MySQL database by dumping it to a timestamped `.sql` file on the target host.

## Usage

Run the playbook specifying the target hosts and optionally override MySQL connection variables:

```bash
ansible-playbook backup_mysql_db.yml -i inventories/inventory.ini -e "target=your_target_group mysql_password=your_password mysql_database=your_db"
````

## Variables

* `mysql_user` (default: `root`): MySQL username with sufficient privileges to dump the database.
* `mysql_password` (required): Password for the MySQL user.
* `mysql_host` (default: `localhost`): MySQL server host.
* `mysql_database` (required): Name of the database to back up.
* `backup_dir` (default: `/opt/homelab/backup/mysql`): Directory where the backup file will be stored.
* `timestamp`: Automatically generated timestamp in `YYYYMMDD_HHMMSS` format for backup filename.
* `backup_file`: Full path of the backup file created.

## What it does

1. Ensures the backup directory exists with `0755` permissions.
2. Runs `mysqldump` to export the specified database to a timestamped `.sql` file.
3. Verifies the backup file was created successfully.
4. Fails the playbook run if the backup file does not exist after dumping.

## Requirements

* `mysqldump` client must be installed on the target host.
* The MySQL user must have permission to perform database dumps.
* The playbook uses `no_log: true` to avoid logging sensitive password information.

## Notes

* Protect the backup directory and files appropriately, as they contain database dumps.
* Consider encrypting backups or transferring them securely off-host.
* Schedule regular cleanups or rotation for old backups separately.
