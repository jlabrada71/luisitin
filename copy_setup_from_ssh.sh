server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem $server:/home/ubuntu/setup-files/* server-domain-setup/
