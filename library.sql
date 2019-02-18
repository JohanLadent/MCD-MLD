/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: Autors
------------------------------------------------------------*/
CREATE TABLE Autors(
	id          INT IDENTITY (1,1) NOT NULL ,
	FirstName   VARCHAR (50) NOT NULL ,
	LastName    VARCHAR (50) NOT NULL  ,
	CONSTRAINT Autors_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Genders
------------------------------------------------------------*/
CREATE TABLE Genders(
	id       INT IDENTITY (1,1) NOT NULL ,
	Gender   VARCHAR (50) NOT NULL  ,
	CONSTRAINT Genders_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Users
------------------------------------------------------------*/
CREATE TABLE Users(
	id          INT IDENTITY (1,1) NOT NULL ,
	FirstName   VARCHAR (50) NOT NULL ,
	LastName    VARCHAR (50) NOT NULL ,
	BirthDate   DATETIME NOT NULL ,
	Mail        VARCHAR (50) NOT NULL  ,
	CONSTRAINT Users_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Book
------------------------------------------------------------*/
CREATE TABLE Book(
	id           INT IDENTITY (1,1) NOT NULL ,
	Title        VARCHAR (150) NOT NULL ,
	BorDate      DATETIME  NOT NULL ,
	ReDate       DATETIME  NOT NULL ,
	id_Genders   INT  NOT NULL ,
	id_Autors    INT  NOT NULL ,
	id_Users     INT  NOT NULL  ,
	CONSTRAINT Book_PK PRIMARY KEY (id)

	,CONSTRAINT Book_Genders_FK FOREIGN KEY (id_Genders) REFERENCES Genders(id)
	,CONSTRAINT Book_Autors0_FK FOREIGN KEY (id_Autors) REFERENCES Autors(id)
	,CONSTRAINT Book_Users1_FK FOREIGN KEY (id_Users) REFERENCES Users(id)
);



