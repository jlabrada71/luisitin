
# create a a directory for a new website and give permissions
# ./setup-domain.sh juanlabrada.com 3100
DOMAIN=$1
PORT=$2

sudo mkdir -p /var/www/$DOMAIN/html
sudo chown -R $USER:$USER /var/www/$DOMAIN/html
sudo chmod -R 755 /var/www/$DOMAIN

#create the first page
sudo cp /home/ubuntu/setup-files/default-index.html /var/www/$DOMAIN/html/index.html

#make your site available
sudo cp /home/ubuntu/setup-files/default-site-available.conf /etc/nginx/sites-available/$DOMAIN

#replace domain
sudo sed -i "s/<domain>/$DOMAIN/g" /etc/nginx/sites-available/$DOMAIN
# setting nginx reverse proxy
#replace port
sudo sed -i "s/<port>/$PORT/g" /etc/nginx/sites-available/$DOMAIN

sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/

#test changes for error
sudo nginx -t

#restart nginx
sudo systemctl restart nginx


#create PM2 config file for site
sudo cp /home/ubuntu/setup-files/template.nestjs.config.js /home/ubuntu/apps/$DOMAIN.config.js

#replace domain
sudo sed -i "s/<domain>/$DOMAIN/g" /home/ubuntu/apps/$DOMAIN.config.js
# setting nginx reverse proxy
#replace port
sudo sed -i "s/<port>/$PORT/g" /home/ubuntu/apps/$DOMAIN.config.js


# getting certificates for the server from https://letsencrypt.org/
# documentation: https://adamtheautomator.com/nginx-subdomain/
