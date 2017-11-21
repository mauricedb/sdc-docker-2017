USE master
CREATE DATABASE PeopleDB
GO
USE PeopleDB

create table People (
	Id INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Email VARCHAR(50),
	Avatar VARCHAR(250)
);

