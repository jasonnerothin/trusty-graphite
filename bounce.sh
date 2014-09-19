#!/bin/bash

IP_ADDR="192.168.33.10"

# expect "Are you sure you want to continue connecting (yes/no)? "
# expect "vagrant@192.168.33.10's password: "

vagrant halt

echo "You need to delete the ssh key from known hosts for the VM that you just destroyed."
read -p "OK (Y/N) > " -n 1 OK
echo

if [ "$OK" == "Y" ] 
then
	echo "Deleting known_hosts entry..."
	sed -i -e '/192\.168\.33\.10/d' ~/.ssh/known_hosts
else
	echo "Terminating..."
	exit 666
fi

echo "Starting up new VM..."
vagrant up

rm *.tgz 
tar cvzf scripts.tgz scripts/
scp scripts.tgz vagrant@${IP_ADDR}:~

vagrant ssh
