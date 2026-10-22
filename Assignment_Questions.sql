USE Hospital;

--> Question 1
Select P.PatientName, W.WardName
From Patients P
INNER JOIN Wards W
    ON P.WardID = W.WardID;


--> Question 2
Select P.PatientName, D.DrugCode
From DrugAdministration DA
INNER JOIN Patients P
    ON DA.PatientID = P.PatientID
INNER JOIN Drugs D
    ON DA.DrugCode = D.DrugCode;


--> Question 3
Select P.PatientName, C.ConsultantName
From Patients P
INNER JOIN Consultants C
    ON P.ConsultantID = C.ConsultantID;


--> Question 4
Select P.PatientName, W.WardName
From Patients P
LEFT JOIN Wards W
    ON P.WardID = W.WardID;


-- Question 5
Select W.WardName, P.PatientName
From Wards W
LEFT JOIN Patients P
    ON W.WardID = P.WardID;


--> Question 6
Select C.ConsultantName, P.PatientName
From Consultants C
LEFT JOIN Patients P
    ON C.ConsultantID = P.ConsultantID;


--> Question 7
Select W.WardName, P.PatientName
From Wards W
LEFT JOIN Patients P
    ON W.WardID = P.WardID;


--> Question 8
Select C.ConsultantName, P.PatientName
From Consultants C
LEFT JOIN Patients P
    ON C.ConsultantID = P.ConsultantID;


--> Question 9
Select P.PatientName, W.WardName
From Patients P
FULL OUTER JOIN Wards W
    ON P.WardID = W.WardID;


--> Question 10
Select C.ConsultantName, P.PatientName
From Consultants C
Full OUTER JOIN Patients P
    ON C.ConsultantID = P.ConsultantID;

--> Question 11
Select N.NurseName, M.NurseName AS ManagerName
From Nurses N
LEFT JOIN Nurses M
    ON N.ManagerID = M.NurseID;


--> Question 12
Select N.NurseName, M.NurseName AS ManagerName
From Nurses N
INNER JOIN Nurses M
    ON N.ManagerID = M.NurseID;


--> Question 13
Select M.NurseName AS ManagerName,
       N.NurseName AS NurseName
From Nurses M
INNER JOIN Nurses N
    ON N.ManagerID = M.NurseID;


--> Question 14
Select P.PatientName, C.ConsultantName
From Patients P
CROSS JOIN Consultants C;


--> Question 15
Select W.WardName, C.ConsultantName
From Wards W
CROSS JOIN Consultants C;


--> Question 16
Select P.PatientName, W.WardName, C.ConsultantName
From Patients P
LEFT JOIN Wards W
    ON P.WardID = W.WardID
LEFT JOIN Consultants C
    ON P.ConsultantID = C.ConsultantID;


--> Question 17
Select P.PatientName, N.NurseName, D.DrugCode
From DrugAdministration DA
INNER JOIN Patients P
    ON DA.PatientID = P.PatientID
INNER JOIN Nurses N
    ON DA.NurseID = N.NurseID
INNER JOIN Drugs D
    ON DA.DrugCode = D.DrugCode;


--> Question 18
Select P.PatientName, W.WardName,
       N.NurseName, DA.Dosage
From DrugAdministration DA
INNER JOIN Patients P
    ON DA.PatientID = P.PatientID
INNER JOIN Nurses N
    ON DA.NurseID = N.NurseID
LEFT JOIN Wards W
    ON P.WardID = W.WardID;


--> Question 19
Select P.PatientName, C.ConsultantName, W.WardName
From Patients P
INNER JOIN Consultants C
    ON P.ConsultantID = C.ConsultantID
LEFT JOIN Wards W
    ON P.WardID = W.WardID;

--> Question 20
Select P.PatientName, N.NurseName,
       D.DrugCode, DA.Dosage,
       DA.AdministrationDate, DA.AdministrationTime
From DrugAdministration DA
INNER JOIN Patients P
    ON DA.PatientID = P.PatientID
INNER JOIN Nurses N
    ON DA.NurseID = N.NurseID
INNER JOIN Drugs D
    ON DA.DrugCode = D.DrugCode;

--> Question 21
Select ConsultantName, Salary,
       ROW_NUMBER() Over (Order By Salary Desc) AS RowNum
From Consultants;


--> Question 22
Select ConsultantName, Salary,
       ROW_NUMBER() Over (Order By Salary ASC) AS RowNum
From Consultants;


--> Question 23
Select ConsultantName, Salary,
       ROW_NUMBER() Over (
           Order By Salary Desc, ConsultantName ASC
       ) AS RowNum
From Consultants;


--> Question 24
Select ConsultantName, Salary,
       RANK() Over (Order By Salary Desc) AS SalaryRank
From Consultants;


--> Question 25
Select ConsultantName, Salary,
       RANK() Over (Order By Salary ASC) AS SalaryRank
From Consultants;


--> Question 26
Select ConsultantName, Salary,
       RANK() Over (Order By Salary Desc) AS SalaryRank
From Consultants
Order By Salary Desc;


--> Question 27
Select ConsultantName, Salary,
       DENSE_RANK() Over (Order By Salary Desc) AS DenseRank
From Consultants;


--> Question 28
Select ConsultantName, Salary,
       DENSE_RANK() Over (Order By Salary Desc) AS DenseRank
From Consultants
Order By Salary Desc;


--> Question 29
Select ConsultantName, Salary,
       RANK() Over (Order By Salary Desc) AS SalaryRank,
       DENSE_RANK() OVER (Order By Salary Desc) AS DenseRank
From Consultants
Order By Salary Desc;

--> Question 30
Select ConsultantName, Salary,
       NTILE(2) Over (Order By Salary Desc) AS SalaryGroup
From Consultants
Order By SalaryGroup ASC, Salary Desc;

--> Question 31
Select ConsultantName, Salary,
       NTILE(3) Over (Order By Salary Desc) AS SalaryGroup
From Consultants
Order By SalaryGroup ASC;


--> Question 32
Select ConsultantName, Salary,
       NTILE(4) Over (Order By Salary Desc) AS SalaryGroup
From Consultants
Order By SalaryGroup ASC;


--> Question 33
Select NurseName, WardID, Salary,
       RANK() Over (
           Partition By WardID
           Order By Salary Desc
       ) AS SalaryRank
From Nurses;


--> Question 34
Select NurseName, WardID, Salary,
       ROW_NUMBER() Over (
           Partition By WardID
           Order By Salary Desc, NurseName ASC
       ) AS RowNum
From Nurses;


--> Question 35
Select NurseName, WardID, Salary,
       DENSE_RANK() Over (
           Partition By WardID
          Order By Salary Desc
       ) AS DenseRank
From Nurses;


--> Question 36
Select NurseName, WardID, Salary,
       NTILE(2) Over (
           Partition By WardID
           Order By Salary Desc
       ) AS SalaryGroup
From Nurses;


--> Question 37
Select N.NurseName, W.WardName, N.Salary,
       RANK() Over (
           Partition By N.WardID
           Order By N.Salary Desc
       ) AS SalaryRank
From Nurses N
LEFT JOIN Wards W
    ON N.WardID = W.WardID;


--> Question 38
WITH ConsultantRanks AS
(
    Select ConsultantID, Salary,
           RANK() Over (Order By Salary Desc) AS SalaryRank
    From Consultants
)
Select P.PatientName, W.WardName,
       CR.SalaryRank
From Patients P
LEFT JOIN Wards W
    ON P.WardID = W.WardID
LEFT JOIN ConsultantRanks CR
    ON P.ConsultantID = CR.ConsultantID;


--> Question 39
WITH NurseRanks AS
(
    Select NurseID, WardID, Salary,
           RANK() Over (
               Partition By WardID
               Order By Salary Desc
           ) AS SalaryRank
    From Nurses
)
Select P.PatientName, N.NurseName,
       DA.Dosage, NR.SalaryRank
From DrugAdministration DA
INNER JOIN Patients P
    ON DA.PatientID = P.PatientID
INNER JOIN Nurses N
    ON DA.NurseID = N.NurseID
LEFT JOIN NurseRanks NR
    ON N.NurseID = NR.NurseID;