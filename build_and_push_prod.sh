
docker build \
  --build-arg GROUPID=$(id -g) \
  --build-arg USERID=$(id -u) \
  --build-arg USERNAME=$USER \
  -f Dockerfile.prod \
  -t pangyuteng/matlab-foobar:prod .

docker push pangyuteng/matlab-foobar:prod