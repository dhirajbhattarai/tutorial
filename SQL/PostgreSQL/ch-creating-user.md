# User Creation
After installing `PostgreSQL` on your machine, you can start working with database directly from the terminal/command. If you want to work in GUI based tools, you have to install the `PgAdmin`.

***Note:*** Change the value inside < angular brackets > and omit the <> in actual command.

---

To create the new database user and database, we can start from the command line, if `createuser` and `createdb` privilege is given.

## Create User
```sh
sudo -u postgres createuser <username>
```
## Create Database
```sh
sudo -u postgres createdb <dbname>
```
## Give the User a Password
```sh
sudo -u postgres psql
alter user <username> with encrypted password '<password>';
```
## Grant Privileges on Database
```sh
grant all privileges on database <dbname> to <username>;
```

---
## Start PostgreSQL interactive terminal
```sh
sudo -u postgres psql
```
The above command gets you the psql command line interface in full admin mode.

## Doing Purely Via PSQL
Let's suppose, I want to create a user having username `storekeeper` and database named `store`. Set user password as `A$tore@35#`.
```sh
sudo -u postgres psql
CREATE DATABASE store;
CREATE USER storekeeper WITH ENCRYPTED PASSWORD 'A$tore@35#';
GRANT ALL PRIVILEGES ON DATABASE store TO storekeeper;
```

## List out all the users
```sh
sudo -u postgres psql
\du
\du+
```

## Select everything from the `pg_catalog.pg_user`
```sh
select * from pg_catalog.pg_user;
```

## Give write/access database permission
```sh
GRANT postgres TO <username>;
```

---
**[Go Back](/postgresql/README.md)**