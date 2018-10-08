create database warehousedb;
use warehousedb;

-- Select
select * from bcpstage;
select * from bcp_state;
select * from bcp_county;
select * from bcp_state_ref;
select * from bcp_validation;

-- Delete
delete from bcpstage;
delete from bcp_state;
delete from bcp_county;
delete from bcp_state_ref;
delete from bcp_validation;

-- Drop
drop table bcpstage;
drop table bcp_state;
drop table bcp_county;
drop table bcp_state_ref;
drop table bcp_validation;


-- create

create table bcpstage(
region varchar(40),
region_code char(2),
period smallint,
state_fips int,
county_fips int,
fips int,
all_providers int,
all_primary_care_providers int,
all_physicians int,
all_primary_care_physicians int,
all_nurse_practitioners int,
all_primary_care_nurse_practitioners int,
all_physician_assistants int,
all_primary_care_physician_assistants int)





create table bcp_state(
region_code char(2) not null,
period smallint not null,
all_providers int,
all_primary_care_providers int,
all_physicians int,
all_primary_care_physicians int,
all_nurse_practitioners int,
all_primary_care_nurse_practitioners int,
all_physician_assistants int,
all_primary_care_physician_assistants int)

alter table bcp_state
add constraint bcp_state_primary_key
primary key clustered (region_code, period)




create table bcp_county(
region_code char(2),
period smallint not null,
county_fips int not null,
fips int not null,
all_providers int,
all_primary_care_providers int,
all_physicians int,
all_primary_care_physicians int,
all_nurse_practitioners int,
all_primary_care_nurse_practitioners int,
all_physician_assistants int,
all_primary_care_physician_assistants int)

alter table bcp_county
add constraint bcp_county_primary_key
primary key clustered (period,fips)




create table bcp_state_ref(
region_code char(2) not null,
region varchar(40) not null,
state_fips int
constraint bcp_state_ref_PK primary key (region_code)
)


create table bcp_validation (
load_count int not null identity(1,1) Primary key,
state_record_count int,
county_record_count int,
validation_status varchar(15)
 )



-- Trigger


ALTER trigger BCP_Automate
on dbo.bcpstage
For Insert
as

declare
 @s_count int, @c_count int, @t_count int, @status varchar(15)
 

Insert into bcp_state 
 Select 
region_code, period,  all_providers, all_primary_care_providers, all_physicians, 
all_primary_care_physicians, all_nurse_practitioners, all_primary_care_nurse_practitioners, 
all_physician_assistants, all_primary_care_physician_assistants 
 from bcpstage 
 where county_fips is Null; 

 Insert into bcp_county 
 Select  
region_code, period, county_fips, fips, all_providers, all_primary_care_providers, all_physicians, 
all_primary_care_physicians, all_nurse_practitioners, all_primary_care_nurse_practitioners, 
all_physician_assistants, all_primary_care_physician_assistants 
 from bcpstage 
 where county_fips is Not Null;

Insert into bcp_state_ref 
Select
 distinct region_code, region, state_fips
from bcpstage   
 
select @t_count =   count(*) from bcpstage;
select @s_count =   count(*) from bcp_state;
select @c_count =   count(*) from bcp_county;

if (@s_count + @c_count = @t_count)
Begin
set @status='Succesful';
end
else
begin
set @status='Unsuccesful';
end

Insert into bcp_validation values(@s_count, @c_count, @status);

