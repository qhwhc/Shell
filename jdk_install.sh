#!/bin/bash
function installJdk(){
    #Download jdk1.8
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
    if [ $? -ne 0 ];then
	apt-get install wget
	if [ $? -ne 0 ];then
	    yum -y install wget
	fi
    fi
    tar -zxvf jdk-8u191-linux-x64.tar.gz
    mkdir -pv /usr/java
    cp -r jdk1.8.0_191/ /usr/java/jdk1.8.0_191
    if [ $? -ne 0 ];then
	cd /usr/java/jdk1.8.0_191
	home=`pwd`
	echo $home
	echo "JAVA_HOME=${home}" >> /etc/profile
	echo "CLASSPATH=\JAVA_HOME/lib" >> /etc/profile
	echo "PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
	source /etc/profile 
    fi
}
installJdk
