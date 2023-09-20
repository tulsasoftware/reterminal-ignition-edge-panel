#!/bin/bash
echo "shutting down ignition edge..."
#shutdown the service
sudo pkill -9 ignition-gatewa

echo "uninstalling ignition edge..."
#remove the startup script
# Remove it from .bashrc
echo "warning: manually remove the line 'sudo /opt/ignitionedge/ignition.sh start' from ~/.bashrc"

#delete the folder
sudo rm -R /opt/ignitionedge/
echo "done."