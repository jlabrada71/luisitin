server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp $server:/home/ubuntu/apps/ci-cd/deploy.js ci-cd/deploy.js 