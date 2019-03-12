--use master;
--go
--drop database athletics;
--go

--create database athletics;
--go
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Creator: Hunter Morrison
Project: CS250 class project
Assignment: Midterm Project
Purpose: Create tables, attributes, and relationships based on lab01 ER diagram
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
use athletics;
go
-- Trainer table
CREATE TABLE Trainer(
	TrainerID int not null,
	TrnrFirstName varchar(15),
	TrnrLastName varchar(15),
	TrnrPhoneNo varchar(15),
	TrnrStreetAddress varchar(50),
	TrnrCity varchar(30),
	TrnrState varchar(5),
	TrnrZip varchar(8),
)
go

-- Athlete table
CREATE TABLE Athlete(
	AthlID int not null,
	AthlFirstName varchar(15),
	AthlLastName varchar(15),
	AthlPhoneNo varchar(15),
	AthlAddress varchar(50),
	AthlCity varchar(30),
	AthlState varchar(5),
	AthlZip varchar(8),
	SportID varchar(5),
)

go

-- Athlete Focus Table
CREATE TABLE AthlFocus(
	SportID varchar(5) not null, -- will all start with 's' followed by idenftifying numerals
	SportName varchar(20),
)
go

-- Facility table
CREATE TABLE Facility(
	FacilityID varchar(5) not null, -- will start with 'f' followed by indentifying numerals
	FacilityPhoneExt varchar(15),
	FacilityAddress varchar(50),
	FacilityCity varchar(30),
	FacilityState varchar(5),
	FacilityZip varchar(8),
)
go

-- Appointment table
CREATE TABLE Appointment(
	ApptID int not null, -- will start with 'ap' followed by indentifying numerals
	ApptDate datetime,
	AthlID int,
	TrainerID int,
	SportID varchar(5),
	FacilityID varchar(5),
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


/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Assigment: Lab04
Date modified: 2/17/2019
Modified by: Hunter Morrison
Description: add 10 records to each table and include select statements to show tables contents
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

INSERT INTO dbo.Trainer(TrainerID,TrnrFirstName,TrnrLastName,TrnrPhoneNo,TrnrStreetAddress,TrnrCity,TrnrState,TrnrZip)
	values(1,'Joe','Smith','123456789','1223 River Drive','Castle Rock','CO','80104'),
		(2,'Ron','Savoy','12345987654','5482 Ditmar Lane','Castle Rock','CO','80104'),
		(3,'Johnny','Niemoth','543126789','2985 Lemur Court','Parker','CO','80123'),
		(4,'Jaime','Ziver','432185918','85 Singapore Street','Larkspur','CO','81132'),
		(5,'Nathan','Trojan','85931478','6302 Lakegulch Road','Castle Rock','CO','80104'),
		(6,'Mark','Springer','3528095301','1653 Lakeview Drive','Crystal Valley','CO','82034'),
		(7,'Amy','Foust','7209534598','530 Perry Street','Littleton','CO','80034'),
		(8,'Marie','Gomez','3036887539','3285 Castleview Place','Castle Rock','CO','80108'),
		(9,'Javier','Montoya','7207659385','4280 Wrigley Circle','Lakewood','CO','80315'),
		(10,'Jordan','Griffin','8356895347','0195 Royce Avenue','Sedalia','CO','80115');

INSERT INTO dbo.Facility(FacilityID,FacilityPhoneExt,FacilityAddress,FacilityCity,FacilityState,FacilityZip)
	values('F01','*810','120 A','Castle Rock','CO','80108'),
		('F02','*095','983 B','Littleton','CO','80119'),
		('F03','*967','654 C','Lakewood','CO','80315'),
		('F04','*532','989 D','Parker','CO','80123'),
		('F05','*140','730 E','Sedalia','CO','80115'),
		('F06','*071','559 F','Roxborough Park','CO','80116'),
		('F07','*095','686 G','Aurora','CO','83115'),
		('F08','*169','239 H','Denver','CO','80013'),
		('F09','*382','160 I','Greenwood Village','CO','81043'),
		('F10','*653','451 J','Parker','CO','80124');

INSERT INTO dbo.AthlFocus(SportID,SportName)
	values('S01','Football'),
		('S02','Soccer'),
		('S03','Rugby'),
		('S04','Swimming'),
		('S05','Track'),
		('S06','Basketball'),
		('S07','Volleyball'),
		('S08','Lacrosse'),
		('S09','Hockey'),
		('S10','Powerlifting');

INSERT INTO dbo.Athlete([AthlID], [AthlFirstName], [AthlLastName], [AthlPhoneNo], [AthlAddress], [AthlCity], [AthlState], [AthlZip])
	values(1,'Joe','Smith','123456789','1223 River Drive','Castle Rock','CO','80104'),
		(2,'Ron','Savoy','12345987654','5482 Ditmar Lane','Castle Rock','CO','80104'),
		(3,'Johnny','Niemoth','543126789','2985 Lemur Court','Parker','CO','80123'),
		(4,'Jaime','Ziver','432185918','85 Singapore Street','Larkspur','CO','81132'),
		(5,'Nathan','Trojan','85931478','6302 Lakegulch Road','Castle Rock','CO','80104'),
		(6,'Mark','Springer','3528095301','1653 Lakeview Drive','Crystal Valley','CO','82034'),
		(7,'Amy','Foust','7209534598','530 Perry Street','Littleton','CO','80034'),
		(8,'Marie','Gomez','3036887539','3285 Castleview Place','Castle Rock','CO','80108'),
		(9,'Javier','Montoya','7207659385','4280 Wrigley Circle','Lakewood','CO','80315'),
		(10,'Bordan','Griffin','8356895347','0195 Royce Avenue','Sedalia','CO','80115');

INSERT INTO dbo.Appointment([ApptID], [ApptDate], [AthlID], [TrainerID], [SportID], [FacilityID])
	values(01,'02/19/2019 09:30',2,8,'S07','F01'),
		(02,'02/20/2019 13:35',5,4,'S02','F01'),
		(03,'02/28/2019 16:00',9,9,'S10','F03'),
		(04,'02/28/2019 12:30',3,1,'S05','F10'),
		(05,'02/28/2019 16:45',6,10,'S03','F06'),
		(06,'03/03/2019 18:00',9,9,'S10','F03'),
		(07,'03/12/2019 06:30',4,4,'S08','F05'),
		(08,'03/15/2019 07:00',2,8,'S07','F01'),
		(09,'03/18/2019 09:30',7,7,'S01','F02'),
		(10,'04/01/2019 10:00',6,10,'S03','F06');

-- Select staements
SELECT *
FROM dbo.Appointment

SELECT *
FROM dbo.Athlete

SELECT *
FROM dbo.AthlFocus

SELECT *
FROM dbo.Facility

SELECT *
FROM dbo.Trainer

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	Assignment : lab5 - add triggers
	Date : 2/22/2019
	Description : add at least one appropriate trigger to database
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

IF OBJECT_ID ('apptAudit', 'U') IS NOT NULL
	DROP TABLE apptAudit;
GO

-- audit table for trigger
CREATE TABLE ApptAudit(
	ApptID int not null, -- starts with 'ap' followed by indentifying numerals
	ApptDate datetime,
	AthlID int,
	TrainerID int,
	SportID varchar(5),
	FacilityID varchar(5),
	ActionPerformed varchar(10),
	LastUpdated datetime,
	UpdatedBy varchar(50),
	
)
GO

IF OBJECT_ID ('tr_aft_appointment', 'U') IS NOT NULL
	DROP TRIGGER tr_aft_appointment;
GO

-- trigger shows when, what, and who made changes to the appointment table
CREATE TRIGGER tr_aft_appointment
ON dbo.Appointment
AFTER UPDATE, INSERT, DELETE
AS
BEGIN
	IF (@@rowcount = 0) RETURN; -- This will exit the trigger if no rows are updated
		set nocount on;

-- handle updates
	IF EXISTS (SELECT * FROM inserted) AND
	   EXISTS (SELECT * FROM deleted)
	BEGIN
		INSERT INTO ApptAudit(ApptID, ApptDate, AthlID, TrainerID, SportID, FacilityID, ActionPerformed, LastUpdated, UpdatedBy)
		SELECT ApptID, ApptDate, AthlID, TrainerID, SportID, FacilityID, 'UPDATE' AS ActionPerformed, GETDATE() AS LastUpdated, SYSTEM_USER AS UpdateBy
		FROM inserted;
	END

-- handle insertions
	ELSE IF EXISTS (SELECT * FROM inserted) AND
	NOT EXISTS (SELECT * FROM deleted)
	BEGIN
		INSERT INTO ApptAudit(ApptID, ApptDate, AthlID, TrainerID, SportID, FacilityID, ActionPerformed, LastUpdated, UpdatedBy)
		SELECT ApptID, ApptDate, AthlID, TrainerID, SportID, FacilityID, 'INSERT' AS ActionPerformed, GETDATE() AS LastUpdated, SYSTEM_USER AS UpdateBy
		FROM inserted;
	END

-- handle deletions
	ELSE IF EXISTS (SELECT * FROM deleted) AND
	NOT EXISTS (SELECT * FROM inserted) 
	BEGIN
		INSERT INTO ApptAudit(ApptID, ApptDate, AthlID, SportID, TrainerID, FacilityID, ActionPerformed, LastUpdated, UpdatedBy)
		SELECT ApptID, ApptDate, AthlID, SportID, TrainerID, FacilityID, 'DELETE' AS ActionPerformed, GETDATE() AS LastUpdated, SYSTEM_USER AS UpdateBy
		FROM deleted;
	END

	RETURN;
END
GO

---- TEST ----

INSERT INTO dbo.Appointment([ApptID], [ApptDate], [AthlID], [TrainerID], [SportID], [FacilityID])
	values(11, '02/22/2019 09:56', 3, 5, 'S04', 'F06');

UPDATE dbo.Appointment set ApptDate = '07/05/2019 10:30'
	WHERE ApptID = 03;

DELETE dbo.Appointment
	WHERE AthlID = 2;

---- SELECT ----

SELECT *
FROM Appointment

SELECT * 
FROM ApptAudit
go
		
	
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Project: Lab6
Description: add 3 views
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- View for trainer's clients
CREATE VIEW vw_Trainer_Client
as
	SELECT A.TrainerID,
			T.TrnrFirstName,
			A.AthlID
	FROM Appointment as A
	JOIN Trainer as T ON T.TrainerID = A.TrainerID;
GO

-- View for Client's Sport/s
CREATE VIEW vw_ClientSport
as
	SELECT C.AthlID,
			C.AthlFirstName,
			F.SportName
	FROM Athlete as C
	JOIN Appointment as A ON C.AthlID = A.AthlID
	JOIN AthlFocus as F ON F.SportID = A.SportID;
GO

-- View for Trainer's used facility/ies
CREATE VIEW vw_Trainer_Facility
as
	SELECT T.TrainerID,
			T.TrnrFirstName,
			F.FacilityID
	FROM Trainer as T
	JOIN Appointment as A ON T.TrainerID = A.TrainerID 
	JOIN Facility as F ON F.FacilityID = A.FacilityID;
GO

/*+++++++++++++++++++++++++++++++
 Select statements
+++++++++++++++++++++++++++++++*/
	
	-- vw_Trainer_Client
SELECT Distinct *
FROM vw_Trainer_Client
ORDER BY TrainerID ASC

	-- vw_ClientSport
SELECT DISTINCT *
FROM vw_ClientSport 
ORDER BY AthlID ASC

	-- vw_Trainer_Facility
SELECT DISTINCT *
FROM vw_Trainer_Facility 
ORDER BY TrainerID ASC


/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Project: Final
Additions: stored proceduere
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

-- Drop 
IF OBJECT_ID('pr_AvailableTrainers','P') is not null
	DROP PROCEDURE pr_AvailableTrainers;
GO

-- create procedure to check for available trainers at a given time
CREATE PROCEDURE pr_AvailableTrainers (@time1 DATETIME, 
										@time2 DATETIME, 
										@desiredTime DATETIME, 
										@workingFacility VARCHAR(5), 
										@athlete int, 
										@sport VARCHAR(7))
AS
DECLARE @returnedPreference DATETIME, 
		@APPID VARCHAR(50),
		@TID int,
		@returnAthlete int,
		@returnTrainer int;
BEGIN
	
	SELECT T.TrainerID, C.AthlID, C.AthlFirstName, C.AthlLastName, A.ApptDate INTO #TEMP
	FROM Appointment AS A
	JOIN Trainer AS T ON T.TrainerID = A.TrainerID
	JOIN Athlete AS C ON C.AthlID = A.AthlID
	WHERE A.ApptDate BETWEEN @time1 AND @time2;
	
	SELECT @returnedPreference = ApptDate
	FROM #TEMP
	WHERE ApptDate = @desiredTime;

	SELECT @returnAthlete = AthlID
	FROM dbo.Appointment
	WHERE AthlID = @returnAthlete;

	IF @returnedPreference IS NULL
	BEGIN
		
		SELECT @APPID = max([ApptID])+1
		FROM dbo.Appointment;
		
		IF @returnathlete IS NULL
		BEGIN

			SELECT TOP 1 @TID = TrainerID
			FROM dbo.Trainer
			ORDER BY NEWID();
		
			INSERT INTO Appointment ([ApptID], [ApptDate], [AthlID], [TrainerID], [SportID], [FacilityID])
			SELECT @APPID, @desiredTime , @athlete, @TID, @sport , @workingFacility;

		END
		
		ELSE IF @returnAthlete IS NOT NULL
		BEGIN

			SELECT @returnTrainer = TrainerID
			FROM dbo.Appointment
			WHERE AthlID = @returnAthlete;

			INSERT INTO Appointment ([ApptID], [ApptDate], [AthlID], [TrainerID], [SportID], [FacilityID])
			SELECT @APPID , @desiredTime, @athlete, @returnTrainer, @sport, @workingFacility;
		END
	END
	RETURN;
END
GO

EXEC pr_AvailableTrainers @time1 = '02/28/2019 11:00', 
						@time2 = '02/28/2019 18:00', 
						@desiredTime = '02/28/2019 14:00', 
						@workingFacility = 'F07', 
						@athlete = 5, 
						@sport = 'S02';
go

select *
From Appointment
