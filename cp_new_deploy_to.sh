server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp ci-cd/new_deploy.sh $server:/home/ubuntu/new_deploy.sh 