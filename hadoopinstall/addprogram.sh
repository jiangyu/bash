#!/bin/bash
hadooppath="/usr/local"
installdir=`dirname "$0"`
installdir=`cd "$installdir"; pwd`
/bin/rpm -ivh lzo-2.04-1.el5.rf.x86_64.rpm
/bin/rpm -ivh lzo-devel-2.04-1.el5.rf.x86_64.rpm 
/bin/rpm -ivh lzop-1.03-2.el5.x86_64.rpm
/bin/rpm -ivh tcl-8.4.13-4.el5.i386.rpm 
/bin/rpm -ivh tcl-devel-8.4.13-4.el5.*
/bin/rpm -ivh expect-5.43.0-5.1.*
/bin/rpm -ivh MegaCli-1.01.09-0.i386.rpm
/bin/cp jdk-6u27-linux-x64.bin $hadooppath
/bin/cp hadoop-0.20.203.0.tgz $hadooppath
cd $hadooppath
/bin/tar -zxvf hadoop-0.20.203.0.tgz
/usr/bin/expect -f $installdir/expect
/bin/rm -f hadoop-0.20.203.0.tgz
/bin/rm -f jdk-6u27-linux-x64.bin
