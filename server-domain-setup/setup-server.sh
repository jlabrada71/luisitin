#install nvm and then node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
node -v
npm -v
npm install pm2@latest -g

#install process manager

pm2 startup systemd
# for the next command take into account node version number and path
which node    #get the node patm
sudo env PATH=$PATH:<node path from previous command>/bin <node path from previous command>/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu

sudo apt update
sudo apt install nginx

# explains how to set up pm2 and nginx for deploying a NODEJS in production
# https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-22-04
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw status # check the firewall status
systemctl status nginx  #check nginx status

cd /home/ubuntu
mkdir data
mkdir pending-deploy
mkdir rollbacks
mkdir untar-files

echo ' { "number": 0 }' >version.json
