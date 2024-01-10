TEMPLATE=nuxt3-tailwinds-storybook

./update_template_get.sh $TEMPLATE
cd $TEMPLATE
pwd
npx nuxi upgrade
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
cd ..
./update_template_put.sh $TEMPLATE

