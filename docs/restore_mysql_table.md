Here is your **playbook to restore a MySQL table** with all documentation sections and no emoticons:

---

# **Restore MySQL Table Playbook**

## **Purpose**

This playbook restores a specific MySQL table from a previously taken SQL backup file.

## **Usage**

Run with:

```bash
ansible-playbook restore_mysql_table.yml -e "mysql_user=root mysql_password=secret mysql_database=mydb mysql_table=mytable target=localhost"
```

Ensure the `backup_file` variable path is correct or adjust it accordingly.

## **Variables**

| Variable         | Description                              | Default Value                                                                               |
| ---------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------- |
| `mysql_user`     | MySQL username                           | `root`                                                                                      |
| `mysql_password` | MySQL password                           | `your_mysql_password`                                                                       |
| `mysql_host`     | MySQL server hostname or IP              | `localhost`                                                                                 |
| `mysql_database` | MySQL database name                      | `your_database_name`                                                                        |
| `mysql_table`    | MySQL table to restore                   | `your_table_name`                                                                           |
| `backup_file`    | Full path to the SQL file to be restored | `/opt/homelab/backup/mysql/mysql_backup_{{ mysql_database }}_{{ mysql_table }}_restore.sql` |

## **What it does**

1. Checks whether the SQL backup file exists.
2. Fails gracefully if the file is missing.
3. Restores the specified MySQL table using the `mysql` CLI.

## **Requirements**

* `mysql` CLI must be installed on the target host.
* An appropriate SQL file should exist at the specified `backup_file` path.
* Ansible 2.9+ (or compatible version).

## **Notes**

* The playbook uses `no_log: true` for the restore task to avoid leaking passwords in logs.
* Ensure correct permissions on backup files and that the MySQL user has sufficient privileges.

---

Let me know if you’d like a matching backup playbook documented in the same format.
