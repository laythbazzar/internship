yum install tmux httpd


rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-7.noarch.rpm
sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
yum --enablerepo=mysql80-community install mysql-community-server


systemctl start httpd
systemctl enable httpd

yum install -y wget createrepo yum-utils

mkdir /var/www/html/localrepo
wget --no-parent -r  http://repo.zabbix.com/zabbix/4.4/rhel/7/x86_64/ -P /var/www/html/localrepo

createrepo /var/www/html

yum-config-manager --add-repo http://192.168.236.4/

vim /etc/yum.repos.d/192.168.236.4_.repo
#gpgcheck=0
#
#

yum clean all

yum install --downloadonly --downloaddir=/var/www/html/localrepo/deps zabbix-web zabbix-agent zabbix-server
yum install --downloadonly --downloaddir=/var/www/html/localrepo/deps OpenIPMI-libs php php-devel php-bcmath php-pear php-gd php-mbstring php-mysql php-xml
createrepo /var/www/html
yum clean all
yum makecache
#yum-configure-manager --disable \*
#yum-configure-manager --enable 192.168.1.16_
#yum install zabbix-web zabbix-agent zabbix-server
