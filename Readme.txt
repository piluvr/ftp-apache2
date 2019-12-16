#Kenny Schmidt Tri-Tech
How to set up an apache server for use of autoconfiguring FTP Users
This was done on Apache 2 on CentOS 8
1. Clone this github repo
	$git clone https://github.com/piluvr/ftp-apache2.git
2. Install Apache 2 and vsftpd
	#apt install apache2 (for Debian and Ubuntu based distributions)
	#dnf install httpd
	#apt install vsftpd  (for Debian and Ubuntu based distributions)
	#dnf install vsftpd
	# systemctl enable httpd
	# systemctl start httpd
3.	Configure Firewall (CentOS)	
	# firewall-cmd --zone=public --permanent --add-service=http
	# firewall-cmd --zone=public --permanent --add-service=https
	# firewall-cmd --add-service=http --permanent
	# firewall-cmd --reload
	# firewall-cmd --add-service=http --permanent
	# firewall-cmd --add-service=https --permanent
4. Add the registration folder to the apache html folder
	$cd ftp-apache2
	#cp registration /var/www/html
5. Add the scripts to visudo
	#visudo /etc/sudoers
	at the end of the file, add 
	apache ALL = NOPASSWD: /var/www/html/registration/script.sh
	apache ALL = NOPASSWD: /var/www/html/registration/create_ftp_user.sh
6.	Navigate to http://localhost/registration and see that it works!	

