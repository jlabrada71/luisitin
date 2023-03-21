echo "usage: copy_ssh.sh <directory> <file> <key.pem> <server> <user>"
echo "ex: copy_ssh.sh app file ~/.ssh/app.pem 3.15.3.12 ubuntu
scp -i $3 $1/$2 $5@$4:/home/$5/pending-deploy/$2
