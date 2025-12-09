server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp $server:/home/ubuntu/new_deploy.sh ci-cd/new_deploy.sh 