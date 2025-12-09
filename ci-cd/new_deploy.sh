echo '' > /home/ubuntu/restart.sh
NODE=$(which node)
$NODE apps/ci-cd/deploy.js
sudo chmod +x /home/ubuntu/restart.sh
/home/ubuntu/restart.sh

