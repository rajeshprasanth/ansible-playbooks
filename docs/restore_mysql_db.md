# Restore MySQL Database Playbook

## Purpose

Restore a full MySQL database from a previously created SQL backup file.

## Usage

Run the playbook using:

```bash
ansible-playbook restore_mysql_database.yml -e "mysql_user=root mysql_password=your_password mysql_database=mydb"
```

Ensure the backup file exists at the specified path before execution.

## Variables

| Variable         | Description                     | Example                                                         |
| ---------------- | ------------------------------- | --------------------------------------------------------------- |
| `mysql_user`     | MySQL user for authentication   | `root`                                                          |
| `mysql_password` | MySQL user's password           | `my_secure_password`                                            |
| `mysql_host`     | MySQL server hostname or IP     | `localhost`                                                     |
| `mysql_database` | Name of the database to restore | `example_db`                                                    |
| `backup_file`    | Path to the SQL backup file     | `/opt/homelab/backup/mysql/mysql_backup_example_db_restore.sql` |

## What it does

1. Checks if the specified SQL backup file exists.
2. Fails the playbook run if the backup file is missing.
3. Restores the specified MySQL database from the SQL file using the `mysql` CLI.

## Requirements

* MySQL server installed and running.
* Valid SQL backup file available.
* `mysql` CLI tool must be accessible on the target host.
* Ansible 2.9+ recommended.

## Notes

* Use strong credentials and manage them securely (consider `ansible-vault`).
* The `no_log: true` directive is used to hide sensitive password information in the logs.
* Ensure the MySQL user has sufficient privileges to perform the restore.
