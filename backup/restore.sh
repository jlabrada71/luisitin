server=$1
../copy_ssh_to.sh apps.tar.gz . ../$1
../copy_ssh_to.sh ubuntu.tar.gz . ../$1
../copy_ssh_to.sh nginx-sites.tar.gz . ../$1