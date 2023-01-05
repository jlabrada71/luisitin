execute in the server setup-domain.sh <domainname.com> <port>
cd apps/$DOMAIN
mv server/index.mjs server/$DOMAIN.mjs
pm2 start server/$DOMAIN.mjs
pm2 save   #save the current process list
pm2 status  #this command shows the status
