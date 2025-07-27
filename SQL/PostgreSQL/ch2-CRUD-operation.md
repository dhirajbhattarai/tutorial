# Connection
Connect to the PostgreSQL server and database.
```
psql
```
If you want to connect to new database.
```
psql new_database
```
List out all the database with `\l`, connect to another database `\c database_name`, list out all the tables & relations `\d`, show the structures/attributes of table `\d table_name`.

## Create
Create a database 'university' & create a table 'student' having 'id', 'name', 'age' and 'email'.
```
CREATE DATABASE university;

CREATE TABLE student(id SERIAL, name VARCHAR(50), age INT, email VARCHAR(100));
```
**Note:** Terminate your query with a semicolon `;`  and Make a habit of writing SQL query in Upper Case and all the attributes in Lower Case.

Add constraints while creating table to avoid errors.
```
CREATE TABLE student(id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(50) NOT NULL, age INT, email VARCHAR(100) NOT NULL);
```

## Insert
There are different ways of inserting data into table.

Insert data without specifying column name.
```
INSERT INTO table_name VALUES(value1, value2, value3);
```
The values entered must be in order of the table's column.

Insert data specifying column name, column's order does not matter.
```
INSERT INTO table_name(column1, column3, column2) VALUES(value1, value3, value2);
```
To insert thousands of records in a single run we can use [text file](person.sql).
```
\i file_name.sql
```
## Read
Show all the data of the table.
```
SELECT * FROM table_name;
```
Show specified colummns
```
SELECT name, email, age FROM student;
```
Show records having Unique column value.
```
SELECT DISTINCT name FROM student;
```
Retrieve only limited rows using `OFFSET` and `LIMIT` keywords.
```
SELECT * FROM student OFFSET 5 LIMIT 10;
```
If you want to limit the records in more SQL format, use `FETCH` insted of `LIMIT`.
```
SELECT * FROM student FETCH FIRST 5 ROW ONLY;
```

## Update
`UPDATE` and `SET` keywords are used to update the records/table.
```
UPDATE table_name SET column_name = 'value' WHERE condition;
```
For Example: `UPDATE person SET name = 'Dhiraj' WHERE id = '1';

**Note:** Always provide `WHERE` clause, otherwise it will update every single records of the table.

## Delete
Delete the database and table.
```
DROP DATABASE database_name;

DROP TABLE table_name;
```
In case you want to delete a single row or multiple rows if some conditions match.
```
DELETE FROM table_name WHERE column_name = value;
```
Clear all the data from table without deleting the table.
```
TRUNCATE table_name;
```
OR
```
TRUNCATE TABLE table_name;
```
Delete all the records from the table.
```
DELETE FROM table_name;
```
**Warning:** Use `WHERE` clause & `Primary Key` while deleting records from the table to prevent unwanted data loss.
```
DELETE FROM table_name WHERE condition;
```

------

[Previous](/PostgreSQL/ch1-installation.md)
[PostgreSQL](/PostgreSQL/README.md)
[Next](/PostgreSQL/ch3-create-table.md)

------