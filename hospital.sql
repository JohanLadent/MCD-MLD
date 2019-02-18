/*------------------------------------------------------------
*        Script SQLSERVER 
------------------------------------------------------------*/


/*------------------------------------------------------------
-- Table: Specialties
------------------------------------------------------------*/
CREATE TABLE Specialties(
	id          INT IDENTITY (1,1) NOT NULL ,
	Specialty   VARCHAR (50) NOT NULL  ,
	CONSTRAINT Specialties_PK PRIMARY KEY (id)
);


/*------------------------------------------------------------
-- Table: Doctors
------------------------------------------------------------*/
CREATE TABLE Doctors(
	id               INT IDENTITY (1,1) NOT NULL ,
	FirstName        VARCHAR (50) NOT NULL ,
	LastName         VARCHAR (50) NOT NULL ,
	Mail             VARCHAR (50) NOT NULL ,
	id_Specialties   INT  NOT NULL  ,
	CONSTRAINT Doctors_PK PRIMARY KEY (id)

	,CONSTRAINT Doctors_Specialties_FK FOREIGN KEY (id_Specialties) REFERENCES Specialties(id)
);


/*------------------------------------------------------------
-- Table: Patients
------------------------------------------------------------*/
CREATE TABLE Patients(
	id           INT IDENTITY (1,1) NOT NULL ,
	FirstName    VARCHAR (50) NOT NULL ,
	LastName     VARCHAR (50) NOT NULL ,
	BirthDate    DATETIME NOT NULL ,
	id_Doctors   INT  NOT NULL  ,
	CONSTRAINT Patients_PK PRIMARY KEY (id)

	,CONSTRAINT Patients_Doctors_FK FOREIGN KEY (id_Doctors) REFERENCES Doctors(id)
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
-- Table: RendezVous
------------------------------------------------------------*/
CREATE TABLE RendezVous(
	id            INT IDENTITY (1,1) NOT NULL ,
	RendezVous    DATETIME NOT NULL ,
	id_Doctors    INT  NOT NULL ,
	id_Schedule   INT  NOT NULL ,
	id_Patients   INT  NOT NULL  ,
	CONSTRAINT RendezVous_PK PRIMARY KEY (id)

	,CONSTRAINT RendezVous_Doctors_FK FOREIGN KEY (id_Doctors) REFERENCES Doctors(id)
	,CONSTRAINT RendezVous_Schedule0_FK FOREIGN KEY (id_Schedule) REFERENCES Schedule(id)
	,CONSTRAINT RendezVous_Patients1_FK FOREIGN KEY (id_Patients) REFERENCES Patients(id)
);



