# Docker for website
This material is used to create Docker containers to host the ubirch website.

## Concepts
The idea is to use a generic webserver contain that can be updated any time independently of the content or database.
The database will get its own docker container from a standard upstream MySQL container. Data are kept in a persistent data container.

## Preparation
Create data persistence container for database:

``` 
$ cd database
$ docker build -f database-data.dockerfile .
[...]
Removing intermediate container ca4900ad3a33
Successfully built 93078858e4e4
$ docker run --name mysql-data 93078858e4e4
```