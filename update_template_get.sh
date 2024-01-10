# TEMPLATE=nuxt3-tailwinds-storybook
TEMPLATE=$1

./copy_ssh_from.sh data/templates/$TEMPLATE.tar.gz . juanlabrada.com.server
 tar -xf $TEMPLATE.tar.gz
 cd $TEMPLATE
 pwd
 npm install
