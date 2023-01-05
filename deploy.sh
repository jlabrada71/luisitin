rm .output -rf
rm juanlabrada.com.tar
GIT_RESULT=$(git status | grep 'nothing to commit, working tree clean')
echo $GIT_RESULT
if [ "$GIT_RESULT" = "" ]; then
  git status
  echo "Pending files commit"
  exit 1
fi

npm run test
TEST_RESULT=$?

if [ $TEST_RESULT -eq 0 ]; then
  npm run build

  FILE=.output
  if [ -d "$FILE" ]; then
    tar -czf juanlabrada.com.tar .output
    cp juanlabrada.com.tar ../../aws-config
    cd ../../aws-config
    ./copy_ssh.sh . juanlabrada.com.tar
  else
    echo "Build failed"
    exit 1
  fi
else 
  echo 'Tests failed'
  exit 1
fi
