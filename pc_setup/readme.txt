Create Group

groupadd hondev

visudo

Then add following lines

%hondev ALL=/etc/init.d/apache2 restart
%hondev ALL=/usr/sbin/service apache2 restart

Add user to the group, so he can restart apache

adduser USERNAME hondev
adduser USERNAME www-data


