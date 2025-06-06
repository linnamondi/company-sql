CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Sex VARCHAR(10),
BirthDate DATE,
Salary DECIMAL(10,2),
BranchID INT,
SupervisorID INT
);

CREATE TABLE Branch (
BranchID INT PRIMARY KEY,
BranchName VARCHAR(100),
ManagerID INT,
ManagerStartDate DATE,
FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

alter table Employee add foreign KEY(BranchID) references  Branch(BranchID);
alter table Employee add FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID)

CREATE TABLE client (
ClientID INT PRIMARY KEY,
ClientName VARCHAR(100),
BranchID INT,
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Works_With (
EmployeeID INT,
ClientID INT,
TotalSales DECIMAL(10,2),
PRIMARY KEY (EmployeeID, ClientID),
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Branch_Supplier (
BranchID INT,
SupplierName VARCHAR(100),
SupplyType VARCHAR(50),
PRIMARY KEY (BranchID, SupplierName),
FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Sex, BirthDate, Salary, BranchID, SupervisorID)
VALUES
(4, 'John', 'Smith', 'Male', '1985-06-15', 75000.00, NULL, NULL),
(5, 'Emily', 'Johnson', 'Female', '1990-04-20', 65000.00, NULL, NULL),
(6, 'David', 'Brown', 'Male', '1992-08-10', 60000.00, NULL, NULL);

INSERT INTO Branch (BranchID, BranchName, ManagerID, ManagerStartDate)
VALUES
(101, 'Downtown', 1, '2018-05-12'),
(102, 'Uptown', 2, '2019-03-21');

INSERT INTO client (ClientID, ClientName, BranchID)
VALUES
(201, 'Tech Solutions', 101),
(202, 'Green Enterprises', 102),
(203, 'Skyline Innovations', 101);

INSERT INTO Works_With (EmployeeID, ClientID, TotalSales)
VALUES
(1, 201, 50000.00),
(2, 202, 35000.00),
(3, 203, 42000.00);

INSERT INTO Branch_Supplier (BranchID, SupplierName, SupplyType)
VALUES
(101, 'ABC Materials', 'Office Supplies'),
(102, 'XYZ Tech', 'Electronics'),
(101, 'Global Foods', 'Catering');

select *
from Employee;

select*
from client;

select *
from Employee
order by Salary;ClientID 


select *
from employee
order by Salary desc ;

select *
from Employee
order by sex,FirstName,LastName;

select *
from Employee
limit 5;

select FirstName,LastName
from Employee;

select FirstName as forename,LastName as surname
from Employee;

select distinct sex
from Employee;

select count(EmployeeID)
from Employee;

select count(EmployeeID)
from employee
where sex='Female' and BirthDate>'1971-02-01';

select AVG(Salary)
from employee;

select AVG(Salary)
from employee
where sex='Male';

select SUM(Salary)
from employee;

select sex,count(sex)
from employee
group by sex;

select  SUM(TotalSales),EmployeeID
from Works_With 
group by EmployeeID;

select  SUM(TotalSales),ClientID 
from Works_With 
group by ClientID ;


select *
from client
where ClientName like '%ns';

select *
from Branch_Supplier
where SupplierName like '% pp %';


select FirstName
from Employee
union
select BranchName
from Branch;

select Salary
from employee
Union
select TotalSales
from Works_With ;

select Employee.EmployeeID,Employee.FirstName,Branch.BranchName 
from Employee
join Branch on Employee.EmployeeID=Branch.ManagerID ;






