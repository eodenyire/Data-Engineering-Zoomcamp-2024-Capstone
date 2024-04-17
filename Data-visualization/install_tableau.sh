#!/bin/bash

# Download Tableau Server installer
curl -O https://downloads.tableau.com/esdalt/2021.3.0/tableau-server-2021-3-0.x86_64.rpm

# Install Tableau Server
sudo yum -y install tableau-server-2021-3-0.x86_64.rpm

# Perform additional configuration steps as needed
# For example, initializing Tableau Server, activating licenses, configuring authentication, etc.

"""
In this script:

The curl command is used to download the Tableau Server installer from the Tableau website. Make sure to replace the URL with the appropriate link for the version you want to install.
The sudo yum -y install command installs Tableau Server using the RPM package.
You can add additional commands to perform any necessary configuration steps after installation, such as initializing Tableau Server, activating licenses, configuring authentication methods, setting up server administrators, etc.
Modify the script according to your specific Tableau Server installation and configuration requirements. After creating this script, it will be executed as part of the EC2 instance provisioning process when you run terraform apply.

"""
