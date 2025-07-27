### Install PostgreSQL on Ubuntu

Ubuntu and most of the linux comes with PostgreSQL pre-installed, however we'll follow from the beginning.

Step 1. Add PostgreSQL Repository

```
sudo sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
```
```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```
```
sudo apt-get update
```
```
sudo apt-get -y install postgresql postgresql-client postgresql-contrib
```

`postgresql` is a core package (server-site) whereas `postgresql-client` works as client-site (command line interface) and `postgresql-contrib` is a package contributed by the community which includes extra features and functionalities such as: ACID transactions, foreign keys, views, sequences, subqueries, triggers, user-defined types and functions, outer joins, multiversion concurrency control.

**Note:** You can install specific version of PostgreSQL by adding version number after the package name (i.e. `postgresql-16`).

### 