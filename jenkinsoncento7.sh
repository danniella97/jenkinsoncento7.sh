#!/bin/bash

#auther: Danniella KITIO
#Date: january 2023

#This is a jenkins script for centos7 server only 

# first step: install java 
yum install java-11-openjdk-devel -y

#second step: enable the jenkins repository
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#third step: install the latest stable version of jenkins
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins

#fourth step: adjust the firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
