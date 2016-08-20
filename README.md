# Dockerized WordPress Multisite

A Dockerised WordPress Multisite Install. **This is a subdirectory install only.**

## How to use this image

```docker run --name wordpress-ms --link some-mysql:mysql -d dylanrhysscott/wordpress-multisite```

The following environment variables can also be set

* ```-e WORDPRESS_DB=...``` - Defaults to ```wordpress```
* ```-e WORDPRESS_URL=...``` - Defaults to ```localhost```
* ```-e WORDPRESS_ADMIN_USER=...``` - Defaults to ```root```
* ```-e WORDPRESS_ADMIN_PASS=...``` - Defaults to ```root```
* ```-e WORDPRESS_ADMIN_EMAIL=...``` - Defaults to ```example@example.com```

## ...via docker-compose

```
wordpress:
  image: dylanrhysscott/wordpress-multisite
  ports: ["80:80"]
  links: ["mysql:mysql"]
mysql:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD: root
```
