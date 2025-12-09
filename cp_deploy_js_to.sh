server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp ci-cd/deploy.js $server:/home/ubuntu/apps/ci-cd
