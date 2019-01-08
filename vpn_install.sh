#!/bin/bash
#author cyb
#centos7 to install docker_vpn

#install docker
docker --version
if [ $? -gt 0 ] ; then
	yum install docker -y
fi
#start docker
service docker start
chkconfig docker on

#pull the ali vpm_image
if [ $? == 0 ]; then
	docker pull oddrationale/docker-shadowsocks
else
    echo  someting erre,please check it!
fi

#start the image with vpn_service
if [ $? == 0 ]; then
	docker run -d -p 12345:12345 oddrationale/docker-shadowsocks -s 0.0.0.0 -p 12345 -k welcome -m aes-256-cfb
	echo 'port : 12345'
	echo 'password : welcome'
fi		
