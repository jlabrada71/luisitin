cat $1 | sed "s/$2/$3/g" > $1.temp
rm $1
mv $1.temp $1
chmod +x $1
echo "=========================="
echo "$1 $3"
echo "--------------------------"
cat $1


