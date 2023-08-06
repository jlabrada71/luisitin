server=`cat $3`
scp -i ~/.ssh/aws-juanlabrada.com.pem $server:/home/ubuntu/$1 $2

