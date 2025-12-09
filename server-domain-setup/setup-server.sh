CURRENT_SERVER=others.server
# this should be the very first step
./copy_setup_to_ssh.sh $CURRENT_SERVER

# connect to the server
./connect_ssh.sh $CURRENT_SERVER

#install nvm and then node js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install node
nvm install 20
nvm alias default 20
node -v
npm -v
npm install pm2@latest -g

#install process manager

pm2 startup systemd
# for the next command take into account node version number and path
which node    #get the node patm
sudo env PATH=$PATH:$NDPTH <node path from previous command{removing the last/bin/node}>/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu

sudo apt update
sudo apt install nginx

# explains how to set up pm2 and nginx for deploying a NODEJS in production
# https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-22-04
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw status # check the firewall status
systemctl status nginx  #check nginx status

mkdir pending-deploy
mkdir apps
# mkdir data
mkdir rollbacks
mkdir untar-files
echo '{ "number": 0 }' > version.json



# disconnet and copy setup files to the server


#copy ci-cd files
./copy_ci-cd_to.sh $CURRENT_SERVER

#connect to the server
./connect_ssh.sh $CURRENT_SERVER

cd pending-deploy
tar -xf ci-cd.tar
mv ci-cd ../apps/
rm ci-cd.tar 
cd ../setup-files
chmod +x setup-domain.sh
chmod +x setup-subdomain.sh
chmod +x setup-nestjs-subdomain.sh
chmod +x setup-app-in-domain.sh

#install certbot

#setup mqtt
sudo apt install -y mosquitto mosquitto-clients
sudo systemctl status mosquitto

#  configure mosquitto
sudo nano /etc/mosquitto/mosquitto.conf
# add the following lines
pid_file /run/mosquitto/mosquitto.pid

# configure passwords
sudo mosquitto_passwd -c /etc/mosquitto/passwd <username>
sudo chown mosquitto /etc/mosquitto/passwd
sudo chgrp mosquitto passwd
sudo chmod 600 /etc/mosquitto/passwd

# add the following lines to /etc/mosquitto/conf.d/default.conf
allow_anonymous false
listener 1883
password_file /etc/mosquitto/passwd


# restart mosquitto
sudo systemctl start mosquitto
sudo systemctl enable mosquitto
sudo systemctl restart mosquitto

#test mosquitto
mosquitto_sub -h 3.135.51.234 -t test -u "wisehome" -P "password"
mosquitto_pub -h 3.135.51.234 -t test -m "hello" -u "wisehome" -P "password"


# pending secure the mqtt server
# read also https://medium.com/gravio-edge-iot-platform/how-to-set-up-a-mosquitto-mqtt-broker-securely-using-client-certificates-82b2aaaef9c8



# apps to create from the original server
ls -l apps | cut -c46-100

