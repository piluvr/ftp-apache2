#!/bin/bash
username="$(cat newfile.txt | head -1 | tail -1)"
password="$(cat newfile.txt | head -2 | tail -1)"
sudo ./create_ftp_user.sh $username $password > log.txt

