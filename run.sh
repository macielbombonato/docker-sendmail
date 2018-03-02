docker stop database
docker rm database
docker run \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_USER=chamilo \
    -e MYSQL_PASSWORD=chamilo \
    -e MYSQL_DATABASE=chamilo \
    -d \
    --name database \
    -v ~/files/chamilo/maria:/var/lib/mysql \
    mariadb

docker stop chamilo
docker rm chamilo
docker run -it \
    --name chamilo \
    --link database \
    -p 8080:80 \
    macielbombonato/docker-chamilo

docker logs -f chamilo
