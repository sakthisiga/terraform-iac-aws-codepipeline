#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>Welcome to StackSimplify - APP-1</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
#echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRkd0GFBjLMx3jEhqds3ZGo8hHMYCSd6vkGI7qR4uiJA5li5Q7VpkyzPnMNj20Eh/2cRYo6cW9odTPLjfKYPcRfkngmMbPG5xx8ftDRpKIp9p++9mwUs8pHAIDp2VBAERTkIC5YhMUSmUpr7IIWachTGDTbMKIp1uk51t3EaJWfYBaC0bKlR42uVxUtjUFO1MB75fNVjXOEu9k8Gb5bqorA4oornPBgr7Je1YD/zFxBEYEbFaPfIMHR/kuAUkCmn5qFERR+g+vACTPZ1fiJxyavrHIuUjo9Vn9xxfVfF3mpWR7m1qtIMEZGG3R7ZFbDjkRPUTo17/lT1Uke83Tv4x+ZisecAJVHvWIHxOBFiAJZfilUnY71EJ1nYWEJf/gkshTXKvzxP58dpLlnemW5pWAHc/yn06ioaZIXljavrGusH2U4+OBweJsG7FkCc/pLteQeHOiDe6dMOfP3xOSPVrzg60L1S9p3SKViyUAYYNXd2dezj2uR0wOUP81cqhR8dU= sakth@DESKTOP-IL2PU60" >> /home/ec2-user/.ssh/authorized_keys
chmod 0600 /home/ec2-user/.ssh/authorized_keys