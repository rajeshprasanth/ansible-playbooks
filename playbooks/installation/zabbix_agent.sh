#!/bin/bash
#
#
#!/bin/bash

# Define the file path
CONFIG_FILE="/etc/zabbix/zabbix_agentd.conf"
#CONFIG_FILE="zabbix_agentd.conf"
# Create the configuration file with the specified content
cat <<EOF > $CONFIG_FILE
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
LogFileSize=0
Server=10.0.0.91
ListenPort=10050
ListenIP=0.0.0.0
ServerActive=10.0.0.91
Hostname=$(hostname)
Include=/etc/zabbix/zabbix_agentd.d/*.conf
EOF

# Set the correct permissions for the file
chmod 0644 $CONFIG_FILE

echo "Zabbix agent configuration file created successfully at $CONFIG_FILE."
