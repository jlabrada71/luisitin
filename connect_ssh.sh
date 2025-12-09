echo "usage: connect_ssh.sh <server>"
server=`cat $1`
ssh -i ~/.ssh/aws-juanlabrada.com.pem $server
