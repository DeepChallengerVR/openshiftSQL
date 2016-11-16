-- create the databse
DROP DATABASE IF EXISTS Elon;
CREATE DATABASE Elon;

-- select the database
USE Elon;

-- create the tables
CREATE TABLE member
(
	member_id	INT(11)		PRIMARY KEY,
    first_name	VARCHAR(25),
	last_name	VARCHAR(25),
	address	VARCHAR(25),
    city VARCHAR(25),
    state VARCHAR(25),
    phone VARCHAR(15)

);

CREATE TABLE association
(
	association_id INT(11) PRIMARY KEY,
    association_name VARCHAR(40)
);

CREATE TABLE member_association
(
	member_id INT(11),  
    association_id INT(11), 
	CONSTRAINT member
		FOREIGN KEY (member_id)
        REFERENCES member(member_id),
	CONSTRAINT association
		FOREIGN KEY (association_id)
        REFERENCES association(association_id)
);
/*
CREATE TABLE member_association
(
	member_id INT(11) REFERENCES member(member_id),
    association_id INT(11) REFERENCES association(association_id)
);
*/