
# to add a subdomain
# create an A record to point to the same ip, or a CNAME record to point to the same url in cloudflare
# create a directory for the subdomain
sudo mkdir -p /var/www/<subdomain>.<your_domain>/html
sudo chown -R $USER:$USER /var/www/<subdomain>.<your_domain>/html
sudo chmod -R 755 /var/www/<subdomain>.<your_domain>

and follow the steps for adding a domain but use instead your <subdomain>.<your_domain>

# getting certificates for the server from https://letsencrypt.org/
# documentation: https://adamtheautomator.com/nginx-subdomain/
