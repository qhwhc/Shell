#!/bin/bash
function installDocker(){
    #remove history docker version
    sudo yum remove docker  docker-common docker-selinux docker-engine
    #insatll needed software pakage
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2
    #set docker repository
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    #install docker-ce
    sudo yum install docker-ce
    #set docker on powerboot
    sudo systemctl start docker
    sudo systemctl enable docker
}
installDocker
