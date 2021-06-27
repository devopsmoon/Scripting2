#!/bin/bash
source components/common.sh
HEAD "Updating system"
yum update -y && yum install epel-release -y && yum update -y
STAT $?
HEAD "Installing nodejs "
yum install nodejs make gcc-c++ -y
STAT $?
HEAD "creating the user"
if [ $? -eq  0 ]
then
  echo -e "\e[1;33mUser is already exists\e[0m"
  else
useradd -d /home/roboshop -m -s /bin/bash roboshop
fi
STAT $?
HEAD "creating the directory"
mkdir -p /home/roboshop/catalogue/ && cd /home/roboshop/catalogue/
STAT $?
HEAD "Downloading the source code from github"
curl -s -L -o /tmp/catalogue.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/558568c8-174a-4076-af6c-51bf129e93bb/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
unzip /tmp/catalogue.zip && npm install
STAT $?
HEAD "Updating the systemd files"
sed -i 's/localhost/172.31.11.66/' /home/roboshop/catalogue/server.js
sed -i 's/MONGO_ENDPOINT/172.31.11.66/' /home/roboshop/catalogue/systemd.service
STAT $?
HEAD "moving the systemd files to systems"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/systemd/catalogue.service
STAT $?
HEAD "Starting the services"
systemctl start catalogue && systemctl enable catalogue
STAT $?



