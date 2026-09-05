#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "=== Starting Apache Installation ==="

# 1. Update the system packages
if command -v dnf &> /dev/null; then
    echo "Updating packages with DNF (Amazon Linux 2023)..."
    sudo dnf update -y
    echo "Installing Apache httpd..."
    sudo dnf install httpd -y
else
    echo "Updating packages with YUM (Amazon Linux 2)..."
    sudo yum update -y
    echo "Installing Apache httpd..."
    sudo yum install httpd -y
fi

# 2. Start the Apache service
echo "Starting Apache service..."
sudo systemctl start httpd

# 3. Enable Apache to start automatically on system boot
echo "Enabling Apache on boot..."
sudo systemctl enable httpd

# 4. Create a basic test landing page
echo "Creating a placeholder index.html..."
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Managed EC2 Web Server</title>
    <style>
        body { font-family: sans-serif; text-align: center; margin-top: 100px; background-color: #f4f6f9; }
        h1 { color: #232f3e; }
        .card { background: white; padding: 30px; display: inline-block; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class="card">
        <h1>Hello from Amazon Linux EC2!</h1>
        <p>Apache HTTP Server has been successfully installed and automated.</p>
    </div>
</body>
</html>
EOF

# 5. Fix permissions for the web directory
sudo chown -R apache:apache /var/www/html/

echo "=== Apache Installation Complete ==="
