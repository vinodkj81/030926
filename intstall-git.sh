#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name:  install_git_al.sh
# Description:  Automated Git installation for Amazon Linux 2 & AL2023.
# -----------------------------------------------------------------------------

# Exit immediately if any command fails
set -e

echo "🔍 Checking for Git..."

# Check if Git is already installed
if command -v git &> /dev/null; then
    echo "✅ Git is already installed. Version: $(git --version)"
    exit 0
fi

# Ensure the script is run with root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "❌ Error: Please run this script with sudo."
    echo "👉 Example: sudo ./install_git_al.sh"
    exit 1
fi

# Detect package manager and install
if command -v dnf &> /dev/null; then
    echo "📦 Amazon Linux 2023 detected. Installing Git via dnf..."
    dnf clean all
    dnf install -y git-core
elif command -v yum &> /dev/null; then
    echo "📦 Amazon Linux 2 detected. Installing Git via yum..."
    yum clean all
    yum install -y git
else
    echo "❌ Error: Neither yum nor dnf package manager was found."
    exit 1
fi

# Verify the installation was successful
if command -v git &> /dev/null; then
    echo "🎉 Success! Git has been installed on Amazon Linux."
    echo "📌 Installed Version: $(git --version)"
else
    	echo "❌ Error: Git installation failed."
    exit 1
fi

