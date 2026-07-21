CREATE DATABASE campusx


-- There is the another way of creating database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'campusx')
BEGIN
	CREATE DATABASE campusx
END


CREATE TABLE users (
	user_id INTEGER, 
	name VARCHAR(255),
	email VARCHAR(255), 
	password VARCHAR(255)
)

CREATE TABLE users1 (
	user_id	INTEGER PRIMARY KEY IDENTITY(1,1), 
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE, 
	password VARCHAR(255) NOT NULL
)


CREATE TABLE customers (
	cid INTEGER PRIMARY KEY IDENTITY(1,1), 
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE
)


CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY IDENTITY(1, 1),
	cid INTEGER NOT NULL,
	order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT orders_fk FOREIGN KEY (cid) REFERENCES customers(cid) 
)


ALTER TABLE customers 
ADD password VARCHAR(255) NOT NULL


ALTER TABLE customers
ADD surname VARCHAR(255) NOT NULL


ALTER TABLE customers
ADD 
	phone_no INTEGER NOT NULL UNIQUE,
	joining_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP


ALTER TABLE customers DROP COLUMN surname


ALTER TABLE customers
DROP CONSTRAINT DF__customers__joini__66603565;

ALTER TABLE customers 
DROP COLUMN password, joining_date


SELECT * FROM customers