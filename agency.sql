/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: Type
------------------------------------------------------------*/
CREATE TABLE Type(
	id     INT IDENTITY (1,1) NOT NULL ,
	Type   VARCHAR (5) NOT NULL  ,
	CONSTRAINT Type_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Real
------------------------------------------------------------*/
CREATE TABLE Real(
	id        INT IDENTITY (1,1) NOT NULL ,
	Name      VARCHAR (50) NOT NULL ,
	zipCode   VARCHAR (5) NOT NULL ,
	Price     MONEY  NOT NULL ,
	id_Type   INT  NOT NULL  ,
	CONSTRAINT Real_PK PRIMARY KEY (id)

	,CONSTRAINT Real_Type_FK FOREIGN KEY (id_Type) REFERENCES Type(id)
);


/*------------------------------------------------------------
-- Table: Customers
------------------------------------------------------------*/
CREATE TABLE Customers(
	id          INT IDENTITY (1,1) NOT NULL ,
	FirstName   VARCHAR (50) NOT NULL ,
	LastName    VARCHAR (50) NOT NULL ,
	Mail        VARCHAR (50) NOT NULL ,
	Budget      MONEY  NOT NULL ,
	id_Type     INT  NOT NULL  ,
	CONSTRAINT Customers_PK PRIMARY KEY (id)

	,CONSTRAINT Customers_Type_FK FOREIGN KEY (id_Type) REFERENCES Type(id)
);


/*------------------------------------------------------------
-- Table: Schedule
------------------------------------------------------------*/
CREATE TABLE Schedule(
	id         INT IDENTITY (1,1) NOT NULL ,
	Schedule   TIME (2) NOT NULL  ,
	CONSTRAINT Schedule_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Rendez-vous
------------------------------------------------------------*/
CREATE TABLE Rendez_vous(
	id             INT IDENTITY (1,1) NOT NULL ,
	RdvDate        DATETIME NOT NULL ,
	id_Real        INT  NOT NULL ,
	id_Schedule    INT  NOT NULL ,
	id_Customers   INT  NOT NULL  ,
	CONSTRAINT Rendez_vous_PK PRIMARY KEY (id)

	,CONSTRAINT Rendez_vous_Real_FK FOREIGN KEY (id_Real) REFERENCES Real(id)
	,CONSTRAINT Rendez_vous_Schedule0_FK FOREIGN KEY (id_Schedule) REFERENCES Schedule(id)
	,CONSTRAINT Rendez_vous_Customers1_FK FOREIGN KEY (id_Customers) REFERENCES Customers(id)
);



