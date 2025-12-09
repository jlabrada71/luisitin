<<<<<<< HEAD
server=`cat $3`
scp -i ~/.ssh/aws-juanlabrada.com.pem $1/$2 $server:/home/ubuntu/pending-deploy/$2
=======
echo "usage: copy_ssh.sh <directory> <file> <key.pem> <server> <user>"
echo "ex: copy_ssh.sh app file ~/.ssh/app.pem 3.15.3.12 ubuntu"
scp -i $3 $1/$2 $5@$4:/home/$5/pending-deploy/$2
>>>>>>> bb1e45d6d9509895e5fe1bcc02eb10230a5e1087
