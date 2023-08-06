server=`cat $3`
scp -i ~/.ssh/aws-juanlabrada.com.pem $1 $server:/home/ubuntu/$2
