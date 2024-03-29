#!/bin/bash

# Create ftp user, create folders and set permissions
# Shamelessly coppied from http://dev.n0ise.net/2012/09/vsftpd-add-user-automation-bash-script/
# Usage: ./create_ftp_user.sh [username] "[password]"
#

NAME=$1
PASS=$2

echo "USAGE: create_ftp_user.sh [username] [password]"

# check input parameters
if [ -z "$NAME" ]; then
    echo "Error: username is not set"
    exit
fi

if [ -z "$PASS" ]; then
    echo "Error: password not set"
    exit
fi

# create system user
echo "Creating user: $NAME"
echo "With password: $PASS"

#adduser $NAME
#passwd $PASS

useradd -p `openssl passwd -1 $PASS` $NAME

# save to users log
echo "user: $NAME, pass: $PASS" >> new_ftp_users_list

# add user to ftp daemon list
echo "$NAME" >> /etc/vsftpd.chroot_list

# create user ftp dir
mkdir /var/ftpupload/$NAME

# Set Ownership
chown $NAME:$NAME /var/ftpupload/$NAME

# Set permissions
chmod 0777 /var/ftpupload/$NAME
# Set Home
usermod --home /var/ftpupload/$NAME $NAME
# restart vsftp daemon
#/etc/init.d/vsftpd restart
