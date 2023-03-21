echo "usage: connect_ssh.sh <key.pem> <user> <server>"
echo "ex: connect_ssh.sh ~/.ssh/app.pem ubuntu  ec2-3-15-9.us-east.amazonaws.com"
ssh -i $1 $2@$3
