#!/bin/bash

##Author: Lionel

##Date: 06/24/22


echo "Java 11 installation"
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
if [ $? -ne 0 ]
then
echo "Java installation failed"
exit 1
fi

echo "Install SonarQube"
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
if [ $? -ne 0 ]
then
echo "wget installation failed"
exit 1
fi

echo "Extract packages"
sudo unzip /opt/sonarqube-9.3.0.51899.zip
cd sonarqube-9.3.0.51899/
cd bin
cd linux-x86-64/
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
./sonar.sh start