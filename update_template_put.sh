# TEMPLATE=nuxt3-tailwinds-storybook
TEMPLATE=$1

 pwd
 rm $TEMPLATE.tar.gz
 rm $TEMPLATE/node_modules -rf
 tar -czf $TEMPLATE.tar.gz $TEMPLATE
 ./copy_ssh_to.sh $TEMPLATE.tar.gz data/templates/$TEMPLATE.tar.gz juanlabrada.com.server
  rm $TEMPLATE -rf
