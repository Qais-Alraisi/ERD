CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50),
    ManagerSSN CHAR(9) NULL
);

CREATE TABLE Employee (
    SSN CHAR(9) PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    SupervisorSSN CHAR(9) NULL,
    DepartmentID INT NULL,
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager
FOREIGN KEY (ManagerSSN) REFERENCES Employee(SSN);

CREATE TABLE Dependent (
    DependentID INT IDENTITY(1,1) PRIMARY KEY,
    DependentName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    EmployeeSSN CHAR(9) NOT NULL,
    FOREIGN KEY (EmployeeSSN) REFERENCES Employee(SSN)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50),
    City VARCHAR(50),
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE WorkingOn (
    SSN CHAR(9) NOT NULL,
    ProjectID INT NOT NULL,
    Hours DECIMAL(5,2) CHECK (Hours >= 0),
    PRIMARY KEY (SSN, ProjectID),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);
