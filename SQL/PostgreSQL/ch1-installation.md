# Installation
As the necessary packages of [PostgreSQL](https://www.postgresql.org/download/linux/ubuntu/) are already installed on Ubuntu, we can directly install PostgreSQL from the apt repository.

### To install the PostgreSQL server locally
```
sudo apt install postgresql postgresql-contib
```
If you want to install specific version of PostgreSQL, add the version of PostgreSQL as suffix such as `postgresql-16`.

### Administration
pgAdmin4 is a GUI for PostgreSQL and is extremely useful for beginner. To setup the repository, see [PgAdmin](https://www.pgadmin.org/download/pgadmin-4-apt/)
```
sudo apt install pgadmin4
```
**Note:** If you want to install only `web-version` or `desktop-version` you can specify while installing `pgadmin4-web` or `pgadmin4-desktop`.

### Connect to the PostgreSQL database server
First, connect to the PostgreSQL server using the `postgres` user:
```
sudo -u postgres psql
```
Second, set a password for `postgres` user:
```
ALTER USER postgres PASSWORD '<your_password>';
```
Third, search the psql command:
```
\?
```
Finally, quit the psql:
```
\q
```

### Basic Server Setup
Start and connect the server as a default `postgres` user created while installing linux.
```
sudo -u postgres psql postgres
```
Set a password for `postgres` using following command.
```
\password postgres
```
To exit from the postgres type `Control+D` or `\q`.

### Create Database
To create a database `mydb` without entering to postgres.
```
sudo -u postgres createdb mydb
```
If you've created a default user same as your linux username, you can do following
```
createdb database_name
```
**Info:** List out all the databases created so far using `\l` command.

### Install Server Instrumentation for PgAdmin for PostgreSQL
PgAdmin requires the installation of `adminpack` for full functionality, which is the part of `postgresql-contrib`.
```
sudo apt install postgresql-contrib
```
```
sudo -u postgres psql CREATE EXTENSION adminpack;
```

### Alternate Server Setup
PostgreSQL creates `postgres` as a default user while installing Ubuntu. Incase you want to create a user with password (with same name as your computer username).
```
sudo -u postgres createuser --superuser $USER

sudo -u postgres psql

postgres=# \password $USER
```
**Warning:** Delete user if not necessary using:
```
sudo -u postgres dropuser $USER -e
```
the `-e` flag returns server response.

Create a database associated with the newly created user with superuser privileges.
```
sudo -u postgres createdb $USER
```
Connecting to your own database to try out some SQL.
```
psql
```
Create an additional database as just as easy.
```
create database mydb;
```

### Managing the server
To create a database with a user that have full rights on the database.
```
sudo -u postgres createuser -D -A -P myuser
```
```
sudo -u postgres createdb -O myuser mydb
```

------

[PostgreSQL](/PostgreSQL/README.md)           [Next](/PostgreSQL/ch2-CRUD-operation.md)

------