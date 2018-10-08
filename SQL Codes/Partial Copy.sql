insert into temp_valid(fips, period, mail_status)
select fips, period,1 from ssis_stage 
where fips is not null
group by fips, period having count(*) >1
	

insert into temp_valid(region_code, period,mail_status)
select region_code, period, 2 from ssis_stage
where fips is null
group by region_code, period having count(*) >1

