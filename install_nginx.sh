#!/bin/bash

# Update the package index
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx
# Check the status of Nginx
sudo systemctl status nginx
# Print a message indicating that Nginx has been installed
echo "<h1>Nginx has been installed and started successfully.</h1>" | sudo tee /var/www/html/index.html
# Print a message indicating that the installation is complete
echo "Nginx installation complete. You can access it at"