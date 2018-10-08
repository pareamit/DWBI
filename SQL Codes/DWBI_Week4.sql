drop table clinic_group_practice

delete  from clinic_group_practice

USE [warehousedb]
GO

select * from clinic_group_practice

/****** Object:  Table [dbo].[clinic_group_practice]    Script Date: 10/6/2018 9:17:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clinic_group_practice](
	[Group Enrollment ID] [varchar](max) NULL,
	[Group Legal_Business Name] [varchar](70) NULL,
	[Group State Code] [varchar](2) NULL,
	[Group Due Date] [datetime] NULL,
	[Group Reassignments and Physician Assistants] [varchar](max) NULL,
	[Record Type] [varchar](19) NULL,
	[Individual Enrollment ID] [varchar](15) NULL,
	[Individual NPI] [int] NULL,
	[Individual First Name] [varchar](25) NULL,
	[Individual Last Name] [varchar](max) NULL,
	[Individual State Code] [varchar](2) NULL,
	[Individual Specialty Description] [varchar](max) NULL,
	[Individual Due Date] [datetime] NULL,
	[Individual Total Employer Associations] [smallint] NULL,
	[Group PAC ID] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


select count(*) from [clinic_group_practice]
