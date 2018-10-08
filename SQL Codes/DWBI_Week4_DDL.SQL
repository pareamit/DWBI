/*
Created: 10/8/2018
Modified: 10/8/2018
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table clinic_group_practice1

CREATE TABLE [clinic_group_practice1]
(
 [Group Enrollment ID] Varchar(max) NULL,
 [Group Legal_Business Name] Varchar(70) NULL,
 [Group State Code] Char(2) NULL,
 [Group Due Date] Datetime NULL,
 [Group Reassignments and Physician Assistants] Varchar(max) NULL,
 [Record Type] Varchar(19) NULL,
 [Individual Enrollment ID] Varchar(15) NULL,
 [Individual NPI] Int NULL,
 [Individual First Name] Varchar(25) NULL,
 [Individual Last Name] Varchar(100) NULL,
 [Individual State Code] Char(2) NULL,
 [Individual Specialty Description] Varchar(100) NULL,
 [Individual Due Date] Datetime NULL,
 [Individual Total Employer Associations] Smallint NULL,
 [Group PAC ID] Bigint NULL
)
go




