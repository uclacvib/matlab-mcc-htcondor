
docker build \
  --build-arg GROUPID=$(id -g) \
  --build-arg USERID=$(id -u) \
  --build-arg USERNAME=$USER \
  -f Dockerfile.dev \
  -t pangyuteng/matlab-foobar:dev .

docker push pangyuteng/matlab-foobar:dev
