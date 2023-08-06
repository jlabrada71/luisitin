server=`cat $3`
scp -i ~/.ssh/aws-juanlabrada.com.pem $1/$2 $server:/home/ubuntu/pending-deploy/$2
