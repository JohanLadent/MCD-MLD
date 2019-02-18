/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/
USE master
GO
CREATE DATABASE School
GO
USE School;
GO

/*------------------------------------------------------------
-- Table: Courses
------------------------------------------------------------*/
CREATE TABLE Courses(
	id       INT IDENTITY (1,1) NOT NULL ,
	Course   VARCHAR (50) NOT NULL  ,
	CONSTRAINT Courses_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Teachers
------------------------------------------------------------*/
CREATE TABLE Teachers(
	id           INT IDENTITY (1,1) NOT NULL ,
	FirstName    VARCHAR (50)  ,
	LastName     VARCHAR (50)  ,
	Mail         VARCHAR (150)  ,
	id_Courses   INT  NOT NULL  ,
	CONSTRAINT Teachers_PK PRIMARY KEY (id)

	,CONSTRAINT Teachers_Courses_FK FOREIGN KEY (id_Courses) REFERENCES Courses(id)
);


/*------------------------------------------------------------
-- Table: Levels
------------------------------------------------------------*/
CREATE TABLE Levels(
	id            INT IDENTITY (1,1) NOT NULL ,
	Level         VARCHAR (20) NOT NULL ,
	id_Teachers   INT  NOT NULL  ,
	CONSTRAINT Levels_PK PRIMARY KEY (id)

	,CONSTRAINT Levels_Teachers_FK FOREIGN KEY (id_Teachers) REFERENCES Teachers(id)
);


/*------------------------------------------------------------
-- Table: Students
------------------------------------------------------------*/
CREATE TABLE Students(
	id          INT IDENTITY (1,1) NOT NULL ,
	FirstName   VARCHAR (50) NOT NULL ,
	LastName    VARCHAR (50) NOT NULL ,
	id_Levels   INT  NOT NULL  ,
	CONSTRAINT Students_PK PRIMARY KEY (id)

	,CONSTRAINT Students_Levels_FK FOREIGN KEY (id_Levels) REFERENCES Levels(id)
);


/*------------------------------------------------------------
-- Table: Notes
------------------------------------------------------------*/
CREATE TABLE Notes(
	id            INT IDENTITY (1,1) NOT NULL ,
	Note          FLOAT  NOT NULL ,
	id_Students   INT  NOT NULL ,
	id_Courses    INT  NOT NULL  ,
	CONSTRAINT Notes_PK PRIMARY KEY (id)

	,CONSTRAINT Notes_Students_FK FOREIGN KEY (id_Students) REFERENCES Students(id)
	,CONSTRAINT Notes_Courses0_FK FOREIGN KEY (id_Courses) REFERENCES Courses(id)
);



