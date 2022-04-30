#!/bin/zsh
HOSTS_FILE_WIN='/mnt/c/Windows/System32/drivers/etc/hosts'
inetIp=`ifconfig eth0 | grep -o "inet [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*  netmask" | cut -f 2 -d " "`

nu=`cat -n ${HOSTS_FILE_WIN} | grep wsl2 | awk '{print $1}'` 

dnsIp=`cat ${HOSTS_FILE_WIN} | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]* wsl #" | cut -f 1 -d " "`

echo "wsl's ip is: ${inetIp}"

# set -x
set -e
if [ ${nu} ] 
then
        if [ ${inetIp} != ${dnsIp} ] 
        then
                echo reset
                sed -i "${nu}d" ${HOSTS_FILE_WIN} 
                echo "${inetIp} wsl #wsl2 dns config" >> ${HOSTS_FILE_WIN}
        fi
else
        echo "${inetIp} wsl #wsl2 dns config" >> ${HOSTS_FILE_WIN}
fi
