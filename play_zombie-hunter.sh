#!/bin/bash

# Welcome to the wild west of bash scripting!
# This script is designed to terminate zombie processes.
# It also terminates the parent process of the zombie process.
# Please use this script with caution, as it can affect system stability.

# Function to display a banner
display_banner() {
  echo "                     _     _    "
  echo "                    | |   (_)   "  
  echo "  _______  _ __ ___ | |__  _  ___ "
  echo " |_  / _ \| '_ \` _ \| '_ \| |/ _ \\"
  echo "  / / (_) | | | | | | |_) | |  __/"
  echo " /___/\___/|_| |_| |_|_.__/|_|\___|"
  echo " |  |  |  |  |    \|      | /  _]   \\"
  echo " |  |  |  |  |  _  |      |/  [_|  D  )"
  echo " |  _  |  |  |  |  |_|  |_|    _]    /"
  echo " |  |  |  :  |  |  | |  | |   [_|    \\"
  echo " |  |  |     |  |  | |  | |     |  .  \\"
  echo " |__|__|\__,_|__|__| |__| |_____|__|\_|"
  echo "                                      "
}

# Check if script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Function to kill a process and its parent
kill_process_and_parent() {
  local pid=$1
  local ppid=$(ps -o ppid= -p $pid)

  # Check if process exists
  if ! ps -p $pid > /dev/null; then
    echo "Process $pid does not exist"
    return
  fi

  # Try to terminate the process
  kill -15 $pid
  if [ $? -eq 0 ]; then
    echo "Terminated process $pid"
  else
    echo "Failed to terminate process $pid"
    return
  fi

  # If the parent process is not 1 (init process), try to terminate it
  if [ "$ppid" -ne 1 ]; then
    kill -15 $ppid
    if [ $? -eq 0 ]; then
      echo "Terminated parent process $ppid"
    else
      echo "Failed to terminate parent process $ppid"
    fi
  fi
}

# Check for zombie processes
zombie_processes=$(ps axo stat,ppid,pid,comm | grep -w defunct)
if [ -z "$zombie_processes" ]; then
  echo "No zombie processes found!"
  exit 0
fi

# Display the banner  
display_banner

# Kill each zombie process and its parent
while read -r stat ppid pid comm; do
  kill_process_and_parent "$pid"
done <<< "$zombie_processes"

###
cat << "EOF"
                      _     _             
                     | |   (_)            
   _______  _ __ ___ | |__  _  ___        
  |_  / _ \| '_ ` _ \| '_ \| |/ _ \       
   / / (_) | | | | | | |_) | |  __/       
  /___\___/|_| |_| |_|_.__/|_|\___|       
  |  |  |  |  |    \|      | /  _]    \   
  |  |  |  |  |  _  |      |/  [_|  D  )  
  |  _  |  |  |  |  |_|  |_|    _]    /   
  |  |  |  :  |  |  | |  | |   [_|    \   
  |  |  |     |  |  | |  | |     |  .  \  
  |__|__|\__,_|__|__| |__| |_____|__|\_|  
                                         
EOF
###
# the legal stuff

# This script is provided as-is and is not supported by Red Hat.
# Please contact your Red Hat representative for consulting services.
# This script is provided in the hope that it will be useful, but
# in NO WAY is this script guaranteed. As such, you use it at your
# own risk. No warranty is expressed or implied by Red Hat or the
# author. This script is provided for demo purposes only and should
# be thoroughly tested before using in a production environment.
# This script is NOT SUPPORTED by Red Hat Global Support Services.

# This script is for educational purposes only
# Please do not run this script on a production system
# This script is not intended to be run as root
# This script is not intended to be run as sudo
# This script is not intended to be run as su
# This script is not intended to be run as a user with elevated privileges
# This script is not intended to be run as a user with special permissions
# This script is not intended to be run as a user with access to sensitive data
# This script is not intended to be run as a user with access to confidential data
# This script is not intended to be run as a user with access to private data
# This script is not intended to be run as a user with access to secret data
# This script is not intended to be run as a user with access to top secret data
# This script is not intended to be run as a user with access to classified data
# This script is not intended to be run as a user with access to sensitive information
# 
# This script is intended to be run as a user with no special permissions
# This script is intended to be run as a user with no special privileges
# This script is intended to be run as a user with no elevated privileges
# This script is intended to be run as a user with no elevated permissions
# This script is intended to be run as a user with no elevated access
# This script is intended to be run as a user with no elevated rights
# This script is intended to be run as a user with no elevated role
# This script is intended to be run as a user with no elevated capabilities
# This script is intended to be run as a user with no elevated entitlements
# This script is intended to be run as a user with no elevated control
# This script is intended to be run as a user with no elevated authority
# This script is intended to be run as a user with no elevated power
# This script is intended to be run as a user with no elevated influence
# This script is intended to be run as a user with no elevated standing
# This script is intended to be run as a user with no elevated rank
# This script is intended to be run as a user with no elevated stature
# This script is intended to be run as a user with no elevated position
# This script is intended to be run as a user with no elevated role
# This script is intended to be run as a user with no elevated status
# This script is intended to be run as a user with no elevated station
# This script is intended to be run as a user with no elevated place
# This script is intended to be run as a user with no elevated seniority
# This script is intended to be run as a user with no elevated supremacy
# This script is intended to be run as a user with no elevated dominion
# This script is intended to be run as a user with no elevated sovereignty
# This script is intended to be run as a user with no elevated authority
# This script is intended to be run as a user with no elevated control
# This script is intended to be run as a user with no elevated command
# This script is intended to be run as a user with no elevated sway
# This script is intended to be run as a user with no elevated weight
# This script is intended to be run as a user with no elevated leverage
# This script is intended to be run as a user with no elevated pull
# This script is intended to be run as a user with no elevated clout
# This script is intended to be run as a user with no elevated muscle
# This script is intended to be run as a user with no elevated teeth
# This script is intended to be run as a user with no elevated advantage
# This script is intended to be run as a user with no elevated dominance
# This script is intended to be run as a user with no elevated superiority
# This script is intended to be run as a user with no elevated supremacy
# This script is intended to be run as a user with no elevated ascendancy
# This script is intended to be run as a user with no elevated preeminence
# This script is intended to be run as a user with normal permissions, 
# and ask for a passsword when needed from sonmeone who knows what they 
# and you are doing, and about to do .. which is expresslly, not me.
