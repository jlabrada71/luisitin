current=`cat current-address.txt`
next=`cat next-address.txt`

echo "from $current to $next"
./replace-address.sh connect_ssh.sh $current $next
./replace-address.sh copy_ssh_from.sh $current $next
./replace-address.sh copy_ssh_setup.sh $current $next
./replace-address.sh copy_ssh.sh $current $next
./replace-address.sh copy_ssh_to.sh $current $next
echo $next >current-address.txt
echo '' >next-address.txt

