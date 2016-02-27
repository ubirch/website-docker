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
Successfully built 014817c7285d
$ docker run --name mysql-data 014817c7285d
```

### Starting MySQL Database Server
Create the credentials file for the MySQL Database:

```
$cat .mysql_credentials
export MYSQL_ROOT_PASSWORD="SuPERsecretMYSQLPASSWORD"
```

Start MySQL-Server for the first time. It will initiate the database files

```
$ source .mysql_credentials
$ docker run --rm --name mysql -p 3306:3306 --volumes-from mysql-data -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} mysql
```

Database data files are stored in the exported volume from mysql-data container.
MySQL Server container can be stopped from another Terminal window:

```
$ docker stop mysql
```

### Connecting to MySQL Database

```
$ docker run -it --rm --link mysql:mysql -v /home/username:/opt mysql /bin/bash
$root@be8b13330709:/mysql -uroot -p -h mysql
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.10 MySQL Community Server (GPL)

Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

File from outside the container are mounted to /opt inside the container:

-v /home/username:/opt
