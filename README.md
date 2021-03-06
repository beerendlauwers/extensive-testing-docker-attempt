# extensive-testing-docker-attempt
An attempt at dockerizing http://www.extensivetesting.org/.

# Why didn't it work?

## New explanation by [cgaulay](http://support.extensive-testing.org/cgaulay):

> Hi @beerendlauwers,
> 
> I've succeed to dockerize the server component.
> 
> As @Denis stated, there is no problem with selinux with the default installation on docker container.
> 
> But there is some problems with the restarting of httpd and mysql services at the end of the installation. It seems like "systemctl start[...]" does not work correctly on docker container. For workaround, try to restart these services manualy using /sbin/httpd and /sbin/mysqld. It works for me after that.
> 
> To use a Dockerfile, you have to customize the custom.sh script using the good commands for restarting services.
> 
> Regards,
> 
> Charly

## Old explanation (incorrect)

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
