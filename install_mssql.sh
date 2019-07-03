#!/bin/sh -e

sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=YourStrong!Passw0rd' -p 1433:1433 -d microsoft/mssql-server-linux:2017-latest


curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee -a /etc/apt/sources.list

sudo apt-get update -qq
sudo ACCEPT_EULA=Y apt-get -y install msodbcsql17
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get -y install mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
sudo apt-get -y install unixodbc-dev

sqlcmd -U sa -P YourStrong!Passw0rd -S localhost -Q "CREATE DATABASE yiitest"

pecl install sqlsrv
pecl install pdo_sqlsrv
