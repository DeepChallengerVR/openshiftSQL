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

CREATE TABLE member_association (
    member_id INT(11),
    association_id INT(11),
    CONSTRAINT member FOREIGN KEY (member_id)
        REFERENCES member (member_id),
    CONSTRAINT association FOREIGN KEY (association_id)
        REFERENCES association (association_id)
);
/* another way to create a association table
CREATE TABLE member_association
(
	member_id INT(11) REFERENCES member(member_id),
    association_id INT(11) REFERENCES association(association_id)
);
*/ 

/* exercise 2 start below */
INSERT INTO member(member_id, first_name, last_name)
	VALUES (6, 'Erik', 'Borchers'), (7, 'Dave', 'Powell');
    
INSERT INTO association(association_id, association_name)
	VALUES (6, 'Elon'), (7, 'Duke');
    
INSERT INTO member_association(member_id, association_id)
	VALUES(6, 6), (7, 7);

SELECT member.first_name, member.last_name, association.association_name
FROM member_association
	JOIN member
		ON member.member_id = member_association.member_id
	JOIN association 
		ON association.association_id = member_association.association_id
ORDER BY 
	association_name, member.last_name, member.first_name;

/* exercise 3 start below */
ALTER TABLE Elon.member
	ADD annual_dues DECIMAL(5,2) DEFAULT 52.50,
	ADD payment_date DATE

;
		