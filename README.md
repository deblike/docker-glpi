# Project to deploy GLPI with docker

[![](https://images.microbadger.com/badges/version/deblike/docker-glpi.svg)](http://microbadger.com/images/deblike/docker-glpi "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/deblike/docker-glpi.svg)](http://microbadger.com/images/deblike/docker-glpi "Get your own image badge on microbadger.com")

Install and run an GLPI instance with docker.

## Deploy GLPI without database
```sh
docker run --name glpi -p 80:80 -d deblike/docker-glpi
```

## Deploy GLPI with existing database
```sh
docker run --name glpi --link yourdatabase:mysql -p 80:80 -d deblike/docker-glpi
```

## Deploy GLPI with database and persistance container data (Recommended)

For an usage on production environnement or daily usage, it's recommanded to use a data container for persistent data.

* First, create data container

```sh
docker create --name glpi-data --volume /var/www/html/glpi:/var/www/html/glpi busybox /bin/true
```

* Then, you link your data container with GLPI container

```sh
docker run --name glpi --hostname glpi --link mysql:mysql --volumes-from glpi-data -p 80:80 -d deblike/docker-glpi
```

Enjoy :)

## Deploy a specific release of GLPI
Default, docker run will use the latest release of GLPI.
For an usage on production environnement, it's recommanded to use the latest release.
Here an example for release 9.1.6 :
```sh
docker run --name glpi --hostname glpi --link mysql:mysql --volumes-from glpi-data -p 80:80 --env "VERSION_GLPI=9.1.6" -d deblike/docker-glpi
```

## Deploy with docker-compose

To deploy with docker compose, you use *docker-compose.yml* and *mysql.env* file.
You can modify **_mysql.env_** to personalize settings like :

* MySQL root password
* GLPI database
* GLPI user database
* GLPI user password

To deploy, just run the following command on the same directory as files

```sh
docker-compose up -d
```
