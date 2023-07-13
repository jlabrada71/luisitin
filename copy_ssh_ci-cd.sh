rm ci-cd.tar 
tar -czf ci-cd.tar ci-cd
scp -i ~/.ssh/aws-juanlabrada.com.pem -rp ci-cd.tar ubuntu@ec2-3-144-81-0.us-east-2.compute.amazonaws.com:/home/ubuntu/pending-deploy
