---Patient Hospital Information System

--Create database HMISAdeGroupNew
Use HMISAdeGroupNew
------------------------------------------------------
create table tblHospitalInformation
(
HospitalId varchar(20) primary key,
[name] varchar(20)not null,
[Address] varchar(20)not null,
City varchar(20)not null,
[State] char(2)not null,
Zipcode char(5)not null,
PhoneNo varchar(15)not null,
EmailAddress nvarchar(20)not null,
FaxNo varchar(15)not null,
Rate char(1) not null
)
----------------------------------------------------------------------
create table Buliding
(        
bulidingId varchar(20) primary key,
HospitalId varchar(20) not null,
BulidingName varchar(15)not null,
BulidingLocation varchar(15)not null,
BuildingFlooreNo varchar(15)not null,
BlockNo varchar(15)not null
foreign key(HospitalId)references tblHospitalInformation(HospitalId)
)
------------------------------------------------------------------------------
create table RoomType
(
RoomTypeid varchar(20) primary key,
RoomTypeName varchar(30)not null,
)
create table cleaner
(
CleanerId varchar(20) primary key,
FName varchar(20) not null,
Lname varchar(20) not null
)
--------------------------------------------------------
create table Room
(
RoomNo varchar(20) primary key,
FlooreNo varchar(15) not null,
RoomTypeId varchar(20) not null,
Availabilty bit not null,
AirConditioned bit not null,
cleaned bit not null,
CleanerId varchar(20) not null,
NoOfBeds varchar(50) not null,
BulidingId varchar(20) not null,
foreign key(BulidingId)references Buliding(bulidingId),
foreign key(RoomTypeId)references RoomType(RoomTypeid),
foreign key(CleanerId)references cleaner(CleanerId),
)
----------------------------------------------------------------
create table BedType
( 
BedTypeId varchar(20) primary key,
BedType varchar(50) not null
)
---Gatch bed,Stretchers bed,Low Beds,Low Air Loss Beds,Circo-Electric beds,Clinitron beds
----------------------------------------------------------------------------
create table Bed
(
BedID varchar(20) primary key,
BedTypeId varchar(20) not null,
RoomId varchar(20) not null,
BedLocation varchar(30) not null,
foreign key(RoomId)references Room(RoomNo),
foreign key(BedTypeId)references BedType(BedTypeId)
)
---------------------------------------------------------------------------
Create table [Address]	
(  
AddressId varchar(20) primary key,
Address1 varchar(20)not null,
Address2 varchar(20),
City	varchar(20)	not null,
[State]	char(2) not null,
ZipCode	char(5) not null,
Country	varchar(50) not null
) 
--------------------------------------------------------------------------------

---------------------------------------------------------------
Create table Gender	
( 
GenderId	varchar(20)	primary key,
GenderName	varchar(30)not null ,
[Description]	varchar(MAX)
)
------------------------------------------------------------------
Create table MaritalStatus
( 
MaritalStatusId	varchar(20) primary Key,
MaritalStatusName	varchar(50) not null,
[Description]	varchar(MAX)
)
-----------------------------------------------------------------------------
Create table Languages	
(
LangueId	varchar(20) Primary Key,
LanguageName	varchar(20) not null,
[Description]	varchar(MAX)
)
----------------------------------------------------------------------------------
Create table Religion	
(
ReligionId	varchar(20) Primary Key,
ReligionName	varchar(20) not null,
[Description]	varchar(MAX)
)
-----------------------------------------------------------------------------------------
create table Race	
(
RaceID	varchar(20) Primary Key,
RaceName	varchar(20) not null,
[Description]	varchar(MAX)
)
-----------------------------------------------------------------------------------------
create table PatientType
(
PatientTypeID	varchar(20) Primary Key,
PatientTypeName	varchar(50) not null,
[Description]	varchar(MAX)
)
----------------------------------------------------------------------------------------
Create table PatientCategory
(
PatientCategoryId	varchar(20) Primary Key,
PatientCategoryName	varchar(50) not null,
[Description]	varchar(MAX)
)
---------------------------------------------------------------------------------
create table VisitStatus
(
VisitStatusId	varchar(20) Primary Key,
VisitStatusName	varchar(50) not null,
[Description]	varchar(MAX)
)
----------------------------------------------------------------------------------
Create table FinancialClass	
(
FinancialClassId	varchar(20) Primary Key,
FinancialClassName	varchar(50) not null,
[Description]	varchar(MAX)
)
-----------------------------------------------------------------------------------
create table AdmissionType
(
AdmissionTypeId	varchar(20) Primary Key,
AdmissionTypeName	varchar(50) not null,
[Description]	varchar(MAX)
)
----------------------------------------------------------------------------------	
create table PointofOrigion
(
PointofOrigionId	varchar(20) Primary Key,
PointofOrigionName	varchar(50) not null,
[Description]	varchar(MAX)
)
---------------------------------------------------------------------------------
Create table AdmissionService
(
AdmissionServiceID	varchar(20) Primary Key,
AdmissionServiceName varchar(50)not null,
[Description]	varchar(MAX)
)
---------------------------------------------------------------------------------
Create table DischargeStatus
(
	DischargeSTatusId	varchar(20) Primary Key,
	DischargeStatusName	varchar(50) not null,
	[Description]	varchar(MAX)
)
-------------------------------------------------------
Create table DischargeDestination
(
	DischargeDestinationId	varchar(20) Primary Key,
	DischargeDestinationName varchar(50) not null,
	[Description]	varchar(MAX)
)
-------------------------------------------------------------------------------
Create table ArrivedBy
(
	ArrivedById	varchar(20) Primary Key,
	ArrivedBYName varchar(50) not null,
	[Description]	varchar(MAX)
)
-------------------------------------------------------------------------------
Create table Severity
(	
	SeverityId	varchar(20) Primary Key,	
	SeverityName varchar(50) not null,	
	[Description]	varchar(MAX)	
)	
-------------------------------------------------------------------------------------
Create table DischargeService
(
	DischargeServiceId	varchar(20) Primary Key,
	DischargeServiceName varchar(50) not null,
	[Description]	varchar(MAX)
)
------------------------------------------------------------------------------------
Create table Guarantor
(
GuarantorRankId varchar(20) primary key,
GuarantorFullName	varchar(50)	not null,
GuarantorAddress varchar(50) not null,
GuarantorCity varchar(30) not null,
GuarantorState char(2) not null,
GuarantorPhone	varchar(50)	not null,
GuarantorLegal	varchar(50) not null	
)
---------------------------------------------------------------------------------
create table Insurance
(
InsuranceTypeId varchar(20) primary key,
InsuranceName varchar(20) not null,
[Description] varchar(max)
)

--------------------------------------------------------------------------------------
Create table EmergencyContact
(
	[EmergencyContactId] varchar(20) primary key NOT NULL,
	[Fname] varchar(30) NOT NULL,
	[Lname] varchar(30) NOT NULL,
	[PhoneNO] varchar(20) NOT NULL,
	[EmailAddress] nvarchar(30) NOT NULL check([EmailAddress] like '%@%'),
	[RelationShips] varchar(20) NOT NULL
)
-----------------------------------------------------------------
Create table Patient
(            
VisitID	varchar(20)	primary key,
FirstName	varchar(50) not null,
MidName	varchar(50),
LastName varchar(50) not null,
FullName varchar(100) not null,
MedRecNo varchar(50) unique  not null,
CurrentAddressId varchar(20) not null,
HomePhone varchar(20),
CellPhone varchar(20),
EmailAddress nvarchar(30) Null check(EmailAddress like'%@%'),
GenderId varchar(20) not null, 
DOB	DateTime not null check(dob<=getdate()),
soc_scu_no	varchar(15) unique not null,
[EmergencyContactId] varchar(20) not null,
MaritalStatusID	varchar(20) not null,
PrimaryLanguage	varchar(20)	not null, 
ReligionTypeId	varchar(20) not null,
RaceTypeId	varchar(20) not null,
PatientTypeID varchar(20) not null,
PatientCategoryID varchar(20) not null,
VisitStatusID varchar(20) not null,
FinClassID	varchar(20) not null,
AdmitDate	DateTime not null default getdate(), 
DischargeDate	DateTime not null ,
AdmissionTypeID	varchar(20) not null,
PointOfOriginID	varchar(20)	not null,
AdmissionServiceID	varchar(20)	not null,
DischargeStatusID	varchar(20) not null,
DischargeDestinationID	varchar(20)	not null,
ArriveByID	varchar(20) not null,
SeverityID	varchar(20)	not null,
NewbornFlag	bit	,
DischargeServiceID	varchar(20) not null,
GuarantorRankId varchar(20) not null,
InsuranceTypeId varchar(20) not null,
foreign key ([EmergencyContactId]) references EmergencyContact([EmergencyContactId]),
foreign key (InsuranceTypeId) references Insurance(InsuranceTypeId),
foreign key (CurrentAddressId) references [Address](AddressId),
foreign key (GenderId) references [Gender]([GenderId]),
foreign key (MaritalStatusID) references [MaritalStatus]([MaritalStatusId]),
foreign key (PrimaryLanguage) references [Languages]([LangueId]),
Foreign Key(ReligionTypeId)references [Religion](ReligionId),
Foreign Key(RaceTypeId)references [Race](RaceId),
Foreign Key(PatientTypeID)references[PatientType](PatientTypeID),
Foreign Key(PatientCategoryId)references [PatientCategory](PatientCategoryId),
Foreign Key(VisitStatusID)references [VisitStatus]([VisitStatusId]),
Foreign Key(FinClassID)references [FinancialClass](FinancialClassId),
Foreign Key(AdmissionTypeID)references [AdmissionType](AdmissionTypeID),
Foreign Key(PointOfOriginID)references [PointofOrigion]([PointofOrigionId]),
Foreign Key(AdmissionServiceID)references [AdmissionService](AdmissionServiceID),
Foreign Key(DischargeStatusID)references [DischargeStatus]([DischargeSTatusId]),
Foreign Key(DischargeDestinationID)references [DischargeDestination](DischargeDestinationID),
Foreign Key(ArriveByID)references [ArrivedBy]([ArrivedById]),
Foreign Key(SeverityID)references[Severity] (SeverityID),
Foreign Key(DischargeServiceID)references[DischargeService] (DischargeServiceID),
Foreign Key(GuarantorRankId)references [Guarantor](GuarantorRankId),
check(DischargeDate>=admitdate)
)

create table Patientaddress
(                             
MedicalRecordNumber	varchar(50),
AddressId varchar(20) not null,
dateStarted datetime not null default getdate(),
DateEnded datetime not null,
primary key (MedicalRecordNUmber,AddressId),
foreign key (AddressId) references [Address](AddressId),
foreign key (MedicalRecordNUmber) references Patient(MedRecNo),
check (dateEnded>datestarted)
)

-------------------------------------------------------------------			
Create table BillingStatus	
(
	BillingSTatusId	varchar(20) Primary Key,
	BillingStatusName varchar(50) not null,
	[Description] varchar(MAX),
)
-----------------------------------------------------------------------	
Create table BillingPatientType
(
	BillingPatientTypeId	varchar(20) Primary Key,
	BillingPatientTypeName	varchar(50) not null,
	[Description]	varchar(MAX)
)
------------------------------------------------------------------------		
Create table BillingPlan	
(
	BillingPlanId	varchar(20) Primary Key,
	BillingPlanName	varchar(50) not null,
	[Description]	varchar(MAX)
)
----------------------------------------------------------------------------		
Create table BillingService	
(
	BillingServiceId varchar(20) Primary Key,
	BillingServiceName	varchar(50) not null,
	[Description]	varchar(MAX)
)
 
--------------------------------------------------------------------
Create table BillingType	
(
	BillingTypeId varchar(20) Primary Key,
	BillingTypeName	varchar(50) not null,
	[Description]	varchar(MAX)
)

--------------------------------------------------------------------------------
Create table Billing	
(	
	BillingId	varchar(20),	
	VisitId	varchar(20),
	BillingInvoice	varchar(50) not null,	
	BillingStatusID	varchar(20) not null,	
	BillingPatientTypeId varchar(20) not null,
	BillingPlanId	varchar(20) not null,
	BillingServiceId	varchar(20) not null,	
	BilledAmt float not null,	
	BillingServiceFrom	Datetime not null,	
	BillingServiceThru	Datetime not null,	
	BillingTypeId	varchar(20) not null,
	BillingAgency varchar(50)  not null,	
	BillingDate	Datetime not null,	
	BillingLastStatmentDate	Datetime not null,	
	BillingLastPaymentDate	Datetime not null,	
	BillingChargeAmt decimal(8,2) not null,	
	BillingInsPmtAmt float not null,	
	BillingInsAdjAmt float not null,	
	BillingPatPmtAmt float not null,	
	BillingPatAdjAmt float not null,	
	BillingTotalPmtAdjAmt float not null,	
	BillingPmtsAdjsRecvd float not null,	
	BillingCoInsAmt	float not null,	
	BillingDedAmt float not null,	
	BillingCurrentBalance float not null
	Primary key (BillingId, VisitId)
	Foreign Key(BillingServiceId) references BillingService(BillingServiceId),
	Foreign Key(BillingStatusID)references BillingStatus(BillingSTatusId),
	Foreign Key(BillingPatientTypeId)references BillingPatientType(BillingPatientTypeId),
	Foreign Key(BillingPlanId)references BillingPlan(BillingPlanId),
	Foreign Key(BillingTypeId)references BillingType(BillingTypeId),
	Foreign Key(VisitId)references patient(VisitId),
)
-----------------------------------------------------------------------------------
create table allergie
(                    
AllergiId varchar(20) primary key,
AllergyType varchar(50) not null,
[Description] varchar(max)
)
------------------------------------------------------------------------------
create table PatientAllergy
(                 
VisitID varchar(20),
AllergiId varchar(20),
DateRecorded datetime  not null,
Note varchar(max)
primary key(VisitID,AllergiId),
foreign key(VisitID)references patient(VisitID),
foreign key(AllergiId)references allergie(AllergiId)
)
----------------------------------------------------------------------------------------

----------------------------------------------------------------------
create table Physician
(
PhysicianID varchar(20) primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Dob date not null check(Dob<dateadd(year,(-18),getdate())),
Email varchar(50) not null check(email like '%@%'),
Phone varchar(15) not null,
Pager varchar(50) not null
)
---------------------------------------------------------------------
create table PatientPhysician
(                              
PhysicianId varchar(20),
VisitId varchar(20),
DateFrom datetime default getdate(),
DateTo datetime not null--- check(dateto>=datefrom)
primary key(PhysicianId,visitId)
foreign key(PhysicianID)references Physician(PhysicianID),
foreign key(visitId)references Patient(visitId),
 check(dateto>=datefrom)
)
-------------------------------------------------------------
create table Nurse
(
NurseId varchar(20) primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Dob date not null check(Dob<dateadd(year,(-18),getdate())),
Email nvarchar(50) not null check(email like '%@%'),
Phone varchar(15) not null,
Pager varchar(50) not null
)
---------------------------------------------------------------
create table PatientNurse
(               
NurseId varchar(20),
visitId  Varchar(20),
DateFrom date default getdate(),
DateTo date not null-- check(dateto>=datefrom),
primary key(Nurseid,visitId),
foreign key(Nurseid)references Nurse(Nurseid),
foreign key(visitId)references Patient(visitId),
check(dateto>=datefrom)
)
-----------------------------------------------------------------------
create table CNA
(
CnaId varchar(20) primary key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Dob date not null check(Dob<dateadd(year,(-18),getdate())),
Email varchar(50) not null check(email like '%@%'),
Phone varchar(15) not null,
Pager varchar(50) not null
)
--------------------------------------------------------------------------
create table PatientCNA
(                     
CnaId varchar(20),
visitId varchar(20),
DateFrom date  default getdate(),
DateTo date not null ----check(dateto>=datefrom)
primary key(visitId,cnaId)
foreign key(visitId)references Patient(visitId),
foreign key(Cnaid)references CNA(CnaId),
check(dateto>=datefrom)
)
--------------------------------------------------------------
create table Therapist
(
TherapistID varchar(20) primary key,
Fname varchar(50) not null,
Lname varchar(50)  not null,
Gender char(1) not null,
Dob date not null check(Dob<dateadd(year,(-18),getdate())),
)
-------------------------------------------------------------------------
create table Therapy	
(                   
TherapyId varchar(20),
TherapistID	varchar(20),
VisitId varchar(20),
PhyscianId	varchar(20),
TherapyType	varchar(30),
[Date]	date  default getdate(),
[Description] varchar(max)
primary key(TherapyId,VisitId,Therapistid,PhyscianId)
foreign key(VisitId)references Patient(visitid),
foreign key(PhyscianId)references Physician(PhysicianID),
foreign key(TherapistId)references Therapist(TherapistID),
)
--------------------------------------------------------------------------
create table LabTechnician
(
LabTechID varchar(20) primary key,
Fname varchar(50),
Lname varchar(50),
Gender char(1),
Dob date not null check(Dob<dateadd(year,(-18),getdate()))
)
---------------------------------------------------------------------------
create table Lab
(                 
Labno varchar(50),
visitId varchar(20),
PhyscianId varchar(20),
LabTechID varchar(20),
[Date] date default getdate(),
PatientType varchar(30),
LabDescription varchar(max) not null,
LabResult varchar(100) not null
primary key(Labno,visitId,PhyscianId,LabTechID)
foreign key(visitId)references Patient(visitid),
foreign key(PhyscianId)references Physician(PhysicianID),
foreign key(LabTechID)references LabTechnician(LabTechID),
)

Create table Internist
(
InternistId varchar(20) primary Key,
Fname varchar(50) not null,
Lname varchar(50) not null,
Dob date not null check(Dob<dateadd(year,(-18),getdate())),
Email varchar(50) not null check(email like'%@%'),
Phone varchar(15) not null,
Pager varchar(50) not null
)
 
---------------------------------------------------------------------
Create table PatientInternist
(                    
InternistId varchar(20),
visitId varchar(20),
DateFrom date default getdate(),
DateTo date not null,-- check(dateto>=Datefrom)
primary key(VisitId,InternistId),
foreign key(visitId)references Patient(visitId),
foreign key(InternistId)references Internist(InternistId),
check(dateto>=Datefrom)
)   

create table Inpatient
(                
VisitId varchar(20),
BedId varchar(20) not null,
PhysicianID varchar(20)not null ,
NurseId varchar(20) not null,
GMLOS varchar(500),
Notes varchar(500),
PreopFlag varchar(50),
Telemetry varchar(50),
AllergieId varchar(500),
NPO varchar(500),
DNR varchar(50),
Fall varchar(50),
PreopFlagVal varchar(50),
LegalStatus varchar(50),
LegalStatusColor varchar(50),
LegalStatusVal varchar(50),
SoundAlike varchar(50),
AdmitDate datetime  default getdate(),
DischargeDate date not null,
PCU varchar(50),
BHUDate date,
BHUTime datetime,
CountDownFromAdmit varchar(50),
PsychiatristSeen varchar(50),
InternistSeen varchar(50),
Flag1 bit,
Flag2 bit
primary key (VisitID,PhysicianID,NurseId),
foreign key(VisitID)references patient(VisitID),
foreign key(PhysicianID)references Physician(PhysicianID),
foreign key(bedid)references Bed(BedId),
foreign key(NurseId)references Nurse(NurseId),
check(DischargeDate>=admitdate)
)
--------------------------------------------------------------------
create table Outpatient	
(             
VisitId	varchar(20),
PhyscianID	varchar(20),
NurseID	varchar(20),
[Date]	datetime default getdate(),
LabNo	varchar(50),
TherapyId varchar(20),
InternistId varchar(20),
Note varchar(500) not null
primary key(visitId,PhyscianID,NurseID)
foreign key(visitId)references  Patient(visitId),
foreign key(PhyscianID)references Physician(PhysicianID),
foreign key(NurseID)references Nurse(NurseID)
)

-------------------------------------------------------------------
create table DiagnosisType
(
DiagnosisTypeID varchar(20) primary key,
DiagnosisType varchar(30)
)
---------------------------------------------------------
create table Diagnosis
(                   
DiagCode varchar(20) primary key,
DiagShortDescription varchar(max) not null,
DiagnosisTypeID varchar(20) not null,
visitId varchar(20) not null,
PhycianID varchar(20) not null,
DiagInfection varchar(max) not null,
DiagComplication varchar(max) not null,
DiagComorbidity varchar(max)not null,
DiagReasonForVisit varchar(max) not null,
DiagRank varchar(max) not null,
DiagLongDescription varchar(max) not null,
DiagSeqNo varchar(50) not null,
DiagAdmitDate date default getdate()
foreign key(DiagnosisTypeID)references DiagnosisType(DiagnosisTypeID),
foreign key(visitId)references Patient(visitId),
foreign key(PhycianID)references Physician(PhysicianID),
)

