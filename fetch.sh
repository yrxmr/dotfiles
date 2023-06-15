#!/bin/bash

# Function to display a header in pale pink/lavender/mauve
display_header() {
  echo -e "\033[1;95m$1\033[0m"
  echo "---------------------------------"
}

# Function to display a section with white text
display_section() {
  echo -e "\033[1;95m$1\033[0m"
  echo -e "\033[1;37m$2\033[0m"
  echo
}

# Display system information
display_header "System Information"

# Display the image using kitty on the left side
image_path="/home/yara/Pictures/controller.jpg"
kitty +kitten icat "$image_path"

# Display the system information on the right side with empty lines after each category
echo
display_section "Hostname" "$(hostname)"

echo
display_section "User" "$(whoami)"

echo
display_section "Kernel Version" "$(uname -r)"

echo
display_section "Distribution" "$(lsb_release -d | cut -f 2)"

echo
display_section "IP Address" "$(hostname -I | awk '{print $1}')"

# Additional system information

echo
display_section "CPU Information" "$(lscpu)"

echo
display_section "Memory Information" "$(free -h)"


echo
display_section "System Uptime" "$(uptime)"

# Any other customizations or commands can be added here
