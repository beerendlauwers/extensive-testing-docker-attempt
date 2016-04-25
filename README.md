# extensive-testing-docker-attempt
An attempt at dockerizing http://www.extensivetesting.org/.

# Why didn't it work?

 [Docker containers do not support SELinux](http://serverfault.com/questions/757606/how-to-enable-selinux-inside-of-a-centos-docker-container), which the server component requires.
 
 I kept getting the following errors when the `install.sh` batch file was run:
 
 ```bash
 Failed to get D-Bus connection: Operation not permitted
setenforce: SELinux is disabled
dos2unix: converting file /opt/xtc//current/Var/Run/httpd.conf to Unix format ...
Failed to get D-Bus connection: Operation not permitted
Unable to restart httpd
```
An issue was opened over at http://support.extensive-testing.org/extensivetesting/core-server/issues/5 .
