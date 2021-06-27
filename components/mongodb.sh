#!/bin/bash
source components/common.sh
HEAD "Updating System"
yum update -y && yum install epel-release -y && yum  update -y
STAT $?
HEAD "Installing mongodb server"
echo '[mongodb-org-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc' >/etc/yum.repos.d/mongodb.repo
yum install mongodb-org -y
STAT $?
HEAD "Updating mongod.conf file"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?
HEAD "Starting mongodb server"
systemctl start mongod && systemctl enable mongod -y
STAT $?
HEAD "Downloading  the source code from github"
curl -s -L -o /tmp/mongodb.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/e9218aed-a297-4945-9ddc-94156bd81427/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
STAT $?
HEAD "Extracting the zip files"
cd /tmp && unzip /tmp/mongodb.zip
STAT $?
HEAD "Downloading the schemas"
mongo < catalogue.js
mongo < users.js
STAT $?


