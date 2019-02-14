/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Creator: Hunter Morrison
Project: CS250 class project
Assignment: Midterm Project
Purpose: Create tables, attributes, and relationships based on lab01 ER diagram
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- Trainer table
CREATE TABLE Trainer(
	TrainerID int not null,
	TrnrFirstName varchar,
	TrnrLastName varchar,
	TrnrPhoneNo varchar,
	TrnrStreetAddress varchar,
	TrnrCity varchar,
	TrnrState varchar,
	TrnrZip varchar,
)
go

-- Athlete table
CREATE TABLE Athlete(
	AthlID int not null,
	AthlFirstName varchar,
	AthlLastName varchar,
	AthlPhoneNo varchar,
	AthlAddtess varchar,
	AthlCity varchar,
	AthlState varchar,
	AthlZip varchar,
	SportID varchar,
)

go

-- Athlete Focus Table
CREATE TABLE AthlFocus(
	SportID varchar not null, -- will all start with 's' followed by idenftifying numerals
	SportName varchar,
)
go

-- Facility table
CREATE TABLE Facility(
	FacilityID varchar not null, -- will start with 'f' followed by indentifying numerals
	FacilityName varchar,
	FacilityPhone varchar,
	FacilityAddress varchar,
	FacilityCity varchar,
	FacilityState varchar,
	FacilityZip varchar,
)
go

-- Appointment table
CREATE TABLE Appointment(
	ApptID varchar not null, -- will start with 'ap' followed by indentifying numerals
	ApptDate date,
	ApptTime time,
	AthlID int,
	TrainerID int,
	SportID varchar,
	FacilityID varchar,
)
go



/*+++++++++++++++
	Primary Keys
+++++++++++++++*/
	
-- Trainer table
ALTER TABLE Trainer
	ADD CONSTRAINT pk_trainer PRIMARY KEY(TrainerID);

-- Athlete table
ALTER TABLE Athlete
	ADD CONSTRAINT pk_athlete PRIMARY KEY(AthlID);
	
-- Athlete Focus table
ALTER TABLE AthlFocus
	ADD CONSTRAINT pk_athlFocus PRIMARY KEY(SportID);

-- Facility table
ALTER TABLE Facility
	ADD CONSTRAINT pk_facility PRIMARY KEY(FacilityID);

-- Appointment table
ALTER TABLE Appointment
	ADD CONSTRAINT pk_appointment PRIMARY KEY(ApptID);



/*++++++++++++++++
	Foreign Keys
++++++++++++++++*/

-- Athlete table
ALTER TABLE Athlete
	ADD CONSTRAINT fk_athlete_focus FOREIGN KEY(SportID) 
	REFERENCES AthlFocus(SportID);

-- Appointment table
ALTER TABLE Appointment
	ADD CONSTRAINT fk_appointment_athlete FOREIGN KEY(AthlID)
	REFERENCES Athlete(AthlID);

ALTER TABLE Appointment
	ADD CONSTRAINT fk_appointment_trainer FOREIGN KEY(TrainerID)
	REFERENCES Trainer(TrainerID);

ALTER TABLE Appointment
	ADD CONSTRAINT fk_appointment_focus FOREIGN KEY(SportID)
	REFERENCES AthlFocus(SportID);

ALTER TABLE Appointment
	ADD CONSTRAINT fk_appointment_facility FOREIGN KEY(FacilityID)
	REFERENCES Facility(FacilityID);



/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		Stored Procedure
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
