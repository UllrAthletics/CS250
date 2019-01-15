

create table Surgery( --create table statement is not case sensitive
	SurgeryNo int,
	SurgeryName varchar(50), -- in sql you must specify num of characters when setting type
	SurgeryType varchar(50),
	Constraint pk_Surgery primary key(SurgeryNo)
);
GO -- go statement terminates batch


create table Appointment(
	AppointmentNo int,
	PhysicianNo int,
	PatientNo int,
	ApptDate datetime,
	SurgNo int,
	Constraint pk_Appointment primary key(AppointmentNo),
	Constraint fk_Appointment_Surgery foreign key(SurgNo) references Surgery(SurgeryNo),
);
GO