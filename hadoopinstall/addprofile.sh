#!/bin/bash
sed -i '$a\alias vi='\''vim'\''' /etc/profile
sed -i '$a\export JAVA_HOME=\/usr\/local\/jdk1.6.0_27' /etc/bashrc
sed -i '$a\export JRE_HOME=\/usr\/local\/jdk1.6.0_27\/jre ' /etc/bashrc
sed -i '$a\export CLASSPATH=.:$JAVA_HOME\/lib:$JAVA_HOME\/jre\/lib' /etc/bashrc
sed -i '$a\export HADOOP_HOME=\/usr\/local\/hadoop-0.20.203.0' /etc/bashrc
sed -i '$a\export HADOOP_LOG_DIR=\/data0\/hadoop\/log' /etc/bashrc
sed -i '$a\export HADOOP_PID_DIR=\/data0\/hadoop\/pid' /etc/bashrc
sed -i '$a\export PATH=$JAVA_HOME\/bin:$JAVA_HOME\/jre\/bin:$HADOOP_HOME\/bin:$PATH' /etc/bashrc
sed -i '$a\*                soft    nofile          65535' /etc/security/limits.conf
sed -i '$a\*                hard    nofile          65535' /etc/security/limits.conf
