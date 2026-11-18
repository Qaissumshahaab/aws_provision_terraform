#!/bin/bash

set -euo pipefail

apt-get update -y

apt-get install -y nginx

systemctl enable nginx

systemctl start nginx

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Web Server</title>
</head>
<body>
    <h1>Terraform deployed successfully!</h1>
</body>
</html>
EOF