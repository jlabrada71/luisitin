server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem server-domain-setup/* $server:/home/ubuntu/setup-files
