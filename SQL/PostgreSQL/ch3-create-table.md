# Create a New Table
Create a new table by specifying the table name, all columns names and their types.
```
CREATE TABLE weather (
    city VARCHAR(80),
    temp_lo INT, -- low temperature
    temp_hi INT, -- high temperature
    prcp REAL, -- precepitation
    date DATE
);
```
Let's create an another table.
```
CREATE TABLE cities (
    name VARCHAR(80),
    location POINT
);
```
If the table is not needed anymore, delete it using
```
DROP TABLE table_name;
```

# Populate a Table With Rows
The `INSERT` statement is used to populate a table with rows.
```
INSERT INTO weather VALUES('San Francisco', 46, 50, 0.25, '1994-11-27');
```
For cities table, `POINT` type requires a coordinate pair
```
INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
```
In above method, the order of the columns is important. We can list the columns explicitly.
```
INSERT INTO weather (city, tamp_lo, temp_hi, percp, date) VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
```
We can order the column in different order as well.
```
INSERT INTO weather (date, city, temp_hi, temp_lo) VALUES ('1994-11-29', 'Hayward', 54, 37);
```
Many developers consider explicitly listing the columns better style than relying on the order implicitly.
`COPY` command can be used to insert data from large flat-files.
```
COPY weather FROM '/home/user/weather.txt';
```

# Query a Table
To retrieve data from a table, the table is `queried`. An SQL `SELECT` statement is used to do this.
To retrieve all the rows & columns.
```
SELECT * FROM weather;
```
To retrieve selective columns.
```
SELECT city, date, prcp FROM weather;
```
We also can do some basic calculation while retrieving data
```
SELECT city, (temp_hi + temp_lo)/2 AS temp_avg, date FROM weather;
```

<!-- ------

[Previous](/PostgreSQL/ch2-CRUD-operation.md)
[PostgreSQL](/PostgreSQL/README.md)
[Next](/PostgreSQL/ch4-shortcut.md)

------ -->

---

| [Previous](/PostgreSQL/ch2-CRUD-operation.md) | [PostgreSQL](/PostgreSQL/README.md) | [Next](/PostgreSQL/ch4-shortcut.md) |
| --- | --- | --- |

