Buy and config the domains 
--------------------------

buy the domain in domainnameapi.com
Set the domain servers in domainnameapi.com
- adel.ns.cloudflare.com
- greg.ns.cloudflare.com

And and config the Domains in Cloudflare
-----------------------------------------

add the domain in cloudflare.com

create a DNS definition file <copy juanlabrada.com.txt into domainname.txt> and change juanlabrada.com in the file by domainname.
If MX records are not required just remove them.
Import the DNS definition file in cloudflare


Config the domain in the app server
---------------------------------

execute in the server setup-domain.sh <domainname.com> <port>
export DOMAIN=tryyourideas.com
mkdir ../apps/$DOMAIN
cd ../apps/$DOMAIN
mv server/index.mjs server/$DOMAIN.mjs
pm2 start server/$DOMAIN.mjs
pm2 save   #save the current process list
pm2 status  #this command shows the status
