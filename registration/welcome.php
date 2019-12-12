<html>
<body>

Welcome <?php echo $_POST["username"]; ?><br>
Your password is: <?php echo $_POST["password"]; ?>
 <?php
$myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
$user = $_POST['username']."\n";
fwrite($myfile, $user);
$pass = $_POST['password']."\n";
fwrite($myfile, $pass);
fclose($myfile);
$output=shell_exec('/var/www/html/registration/script.sh');
?>
<pre>
HOST: 10.183.5.3
USER: <?php echo $user;?>
PASS: <?php echo $pass;?>
PORT: 22
WRITEABLE DIRECTORY: /var/ftpupload/<?php echo $user;?>
</pre>
</body>
</html>

