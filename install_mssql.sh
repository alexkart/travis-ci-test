#!/bin/sh -e

sudo docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=YourStrong!Passw0rd' -p 1433:1433 -d microsoft/mssql-server-linux:2017-latest

sudo apt install php-dev php-pear
sudo pecl install pdo_sqlsrv