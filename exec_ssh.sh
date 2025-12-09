server=`cat $1`
ssh -i ~/.ssh/aws-juanlabrada.com.pem $server "$2"
