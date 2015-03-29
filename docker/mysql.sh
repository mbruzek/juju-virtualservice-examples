set +x
docker \
  run \
  --detach \
  --env MYSQL_ROOT_PASSWORD=root \
  --env MYSQL_USER=root \
  --env MYSQL_PASSWORD=password \
  --env MYSQL_DATABASE=juju \
  --name juju_test \
  --publish 3306:3306 \
  mysql:5.7;
