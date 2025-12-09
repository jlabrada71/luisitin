rm ci-cd.tar 
tar -czf ci-cd.tar ci-cd
server=`cat $1`
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp ci-cd.tar $server:/home/ubuntu/pending-deploy
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp ci-cd/new_deploy.sh $server:/home/ubuntu/