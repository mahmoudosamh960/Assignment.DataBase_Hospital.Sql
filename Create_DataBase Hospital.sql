Create DataBase Hospital;

Use Hospital;


Create Table Wards
(
    WardID Int Primary Key,
    WardName Varchar(50),
    Location Varchar(50)
);

 Create Table Consultants
(
    ConsultantID Int Primary Key,
    ConsultantName Varchar(50),
    Salary Decimal(10,2),
    WardID Int References Wards(WardID)
);

Create Table Patients
(
    PatientID Int Primary Key,
    PatientName Varchar(50),
    WardID Int References Wards(WardID),
    ConsultantID Int References Consultants(ConsultantID)
);

Create Table Nurses
(
    NurseID Int Primary Key,
    NurseName Varchar(50),
    Salary Decimal(10,2),
    WardID Int References Wards(WardID),
    ManagerID Int References Nurses(NurseID)
);

Create Table Drugs
(
    DrugCode Int Primary Key,
    DrugName Varchar(50)
);

Create Table DrugAdministration
(
    AdministrationID Int Primary Key,
    PatientID Int References Patients(PatientID),
    NurseID Int References Nurses(NurseID),
    DrugCode Int References Drugs(DrugCode),
    Dosage Varchar(50),
    AdministrationDate Date,
    AdministrationTime Time
);


USE HospitalDB;
GO

Insert Into Wards (WardID, WardName, Location)
Values
(1, 'Emergency', 'Floor 1'),
(2, 'Surgery', 'Floor 2'),
(3, 'Children', 'Floor 3'),
(4, 'Empty Ward', 'Floor 4');

Insert Into Consultants (ConsultantID, ConsultantName, Salary, WardID)
Values
(1, 'Ahmed Ali', 25000, 1),
(2, 'Mona Samir', 30000, 2),
(3, 'Omar Hassan', 20000, 1),
(4, 'Sara Adel', 35000, 3);

Insert Into Patients (PatientID, PatientName, WardID, ConsultantID)
Values
(1, 'Mohamed', 1, 1),
(2, 'Nour', 2, 2),
(3, 'Ali', 1, 3),
(4, 'Salma', 3, 4),
(5, 'Youssef', NULL, 1);

Insert Into Nurses (NurseID, NurseName, Salary, WardID, ManagerID)
Values
(1, 'Hany', 12000, 1, NULL),
(2, 'Mai', 10000, 1, 1),
(3, 'Nada', 11000, 2, 1),
(4, 'Amr', 9000, 3, NULL);

Insert Into Drugs (DrugCode, DrugName)
Values
(101, 'Panadol'),
(102, 'Antibiotic'),
(103, 'Vitamin C');

Insert Into DrugAdministration
(AdministrationID, PatientID, NurseID, DrugCode,
 Dosage, AdministrationDate, AdministrationTime)
Values
(1, 1, 1, 101, '500 mg', '2026-10-20', '08:00'),
(2, 2, 3, 102, '250 mg', '2026-10-20', '10:00'),
(3, 3, 2, 103, '100 mg', '2026-10-21', '12:00'),
(4, 1, 2, 102, '250 mg', '2026-10-21', '14:00'),
(5, 4, 4, 101, '500 mg', '2026-10-22', '09:00');
