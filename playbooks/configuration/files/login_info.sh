#!/bin/bash

# Function to get system information
get_system_info() {
    HOSTNAME=$(hostname)
    HOST_IP_ADDRESS=$(hostname -I | cut -d ' ' -f 1)
    LOAD_AVERAGE=$(uptime | awk -F 'load average: ' '{print $2}' | cut -d ',' -f 1-3)
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')
}

# Function to get user login details
get_login_details() {
    USER_ID=$1
    if [ -n "$(who am i | grep $USER_ID)" ]; then
        if [ -n "$SSH_CONNECTION" ]; then
            LOGIN_METHOD="SSH"
            REMOTE_IP_ADDRESS=$(echo "$SSH_CONNECTION" | awk '{print $1}')
        else
            LOGIN_METHOD="Console"
            REMOTE_IP_ADDRESS="N/A"
        fi
        # Display the MOTD
        echo "Current Date and Time: $(date)"
        echo "****************************************************************************************"
        echo "*                            WARNING: AUTHORIZED ACCESS ONLY                           *"
        echo "****************************************************************************************"
        echo "* This  system  is  for  the  use  of  authorized users  only. Individuals using this  *"
        echo "* computer  system without authority, or in excess of their  authority,  are  subject  *"
        echo "* to having all of their activities on this system monitored and  recorded  by system  *"
        echo "* personnel. If you are not an authorized user, disconnect immediately.  Unauthorized  *"
        echo "* access to this system is prohibited and is subject to criminal and civil penalties.  *"
        echo "* All  activity  on  this system  is logged. By continuing  to us  this  system,  you  *"
        echo "* indicate  your  awareness  of and consent to these terms  and  conditions  of  use.  *"
        echo "****************************************************************************************"
        echo "Host: $HOSTNAME ($HOST_IP_ADDRESS)"
        echo "Load Average: $LOAD_AVERAGE"
        echo "Disk Usage: $DISK_USAGE"
        echo "Logged in via: $LOGIN_METHOD"
        echo "Logged as: $USER_ID from $REMOTE_IP_ADDRESS"
        echo "****************************************************************************************"
    fi
}

# Main function
main() {
    get_system_info
    get_login_details $USER
}

# Execute main function
main

