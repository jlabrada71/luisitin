echo "usage: copy_ssh_setup.sh <privatekeyfile> <targetserver> <user>"
echo "ex: copy_ssh_setup.sh ~/.ssh/app.pem 2.4.2.4 ubuntu"

scp -i $1 server-domain-setup/* $3@$2:/home/$3/setup-files
