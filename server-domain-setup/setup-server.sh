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
sudo env PATH=$PATH:/home/ubuntu/.nvm/versions/node/v18.8.0/bin /home/ubuntu/.nvm/versions/node/v18.8.0/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu

sudo apt update
sudo apt install nginx

# explains how to set up pm2 and nginx for deploying a NODEJS in production
# https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-22-04
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo ufw status # check the firewall status
systemctl status nginx  #check nginx status

# create a a directory for a new website and give permissions
sudo mkdir -p /var/www/<your_domain>/html
sudo chown -R $USER:$USER /var/www/<your_domain>/html
sudo chmod -R 755 /var/www/<your_domain>

#create the first page
sudo vi /var/www/<your_domain>/html/index.html
<html>
    <head>
        <title>Welcome to your_domain!</title>
    </head>
    <body>
        <h1>Success!  The your_domain server block is working!</h1>
    </body>
</html>

#make your site available
sudo nano /etc/nginx/sites-available/<your_domain>
server {
        listen 80;
        listen [::]:80;

        root /var/www/<your_domain>/html;
        index index.html index.htm index.nginx-debian.html;

        server_name <your_domain> www.<your_domain>;

        location / {
                try_files $uri $uri/ =404;
        }
}

sudo ln -s /etc/nginx/sites-available/<your_domain> /etc/nginx/sites-enabled/

# enable bucket_size by uncommenting the given line
sudo nano /etc/nginx/nginx.conf

http {
    ...
    server_names_hash_bucket_size 64;
    ...
}

#test changes for error
sudo nginx -t

#restart nginx
sudo systemctl restart nginx

#nginx logs
/var/log/nginx/access.log
/var/log/nginx/error.log


cd apps/<yourdomain>
mv server/index.mjs server/<yourdomain>.mjs
pm2 start server/mirielaulloacom.mjs
pm2 save   #save the current process list
pm2 status  #this command shows the status
sudo systemctl start pm2-ubuntu   #start the service
systemctl status pm2-ubuntu       #check service status

systemctl status pm2-ubuntu.service  #check for service errors
journalctl -xeu pm2-ubuntu.service


# setting nginx reverse proxy
sudo nano /etc/nginx/sites-available/<your_domain>

# change the location content to for https://<your domain>
# set the port to the port defined for your node server 
# remember that each node app need to have a different port

server {
...
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
...
}

# for https://<your domain>/app2
server {
...
    location /app2 {
        proxy_pass http://localhost:3001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
...
}

# to add a subdomain
# create an A record to point to the same ip, or a CNAME record to point to the same url in cloudflare
# create a directory for the subdomain
sudo mkdir -p /var/www/<subdomain>.<your_domain>/html
sudo chown -R $USER:$USER /var/www/<subdomain>.<your_domain>/html
sudo chmod -R 755 /var/www/<subdomain>.<your_domain>

and follow the steps for adding a domain but use instead your <subdomain>.<your_domain>

# getting certificates for the server from https://letsencrypt.org/
# documentation: https://adamtheautomator.com/nginx-subdomain/
