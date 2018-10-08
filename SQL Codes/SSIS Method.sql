select * from ssis_stage where county_fips is null;

select * from bcp_validation;

drop table ssis_county;
drop table ssis_state;

create table ssis_county(
	[region_code] [char](2),
	[period] [smallint] not null ,
	[county_fips] [int] ,
	[fips] [int] not null,
	[all_providers] [int] ,
	[all_primary_care_providers] [int],
	[all_physicians] [int],
	[all_primary_care_physicians] [int] ,
	[all_nurse_practitioners] [int],
	[all_primary_care_nurse_practitioners] [int],
	[all_physician_assistants] [int],
	[all_primary_care_physician_assistants] [int] )
 

	alter table ssis_county
add constraint ssis_county_primary_key
primary key clustered (period,fips)


	CREATE TABLE ssis_state(
	[region_code] [char](2),
	[period] [smallint] ,
	[all_providers] [int] ,
	[all_primary_care_providers] [int],
	[all_physicians] [int],
	[all_primary_care_physicians] [int] ,
	[all_nurse_practitioners] [int],
	[all_primary_care_nurse_practitioners] [int],
	[all_physician_assistants] [int],
	[all_primary_care_physician_assistants] [int] 
 
Constraint  PK Primary Key clustered (region_code, [period])

)

create table ssis_state_ref(region_code char(2) primary key,
region varchar(40),
state_fips int)

delete from ssis_county
delete from ssis_state
delete from ssis_state_ref

select * from ssis_state_ref;