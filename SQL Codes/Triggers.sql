alter trigger Partial_True_Copy
on temp_valid
for insert

as 

declare
@m_status int

select @m_status = mail_status from temp_valid


if (@m_status =1)
Begin
EXEC msdb.dbo.sp_send_dbmail

@profile_name = 'DWBIMailProfile',
@execute_query_database = 'warehousedb',
@recipients = 'pareamitp@gmail.com',
@query_result_header = 1,
@query = 'select * from temp_valid',
@subject = 'DWBI Mail Chain',
@body='Following Redundant Rows Deleted',
@attach_query_result_as_file = 0
End

Else
 
 if (@m_status = 2)
Begin
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'DWBIMailProfile',
@execute_query_database = 'warehousedb',
@recipients = 'pareamitp@gmail.com',
@query_result_header = 1,
@query = 'select * from temp_valid',
@subject = 'DWBI Mail Chain',
@body='Conflict for this Primary Key Records',
@attach_query_result_as_file = 0
End


alter trigger NoLoadTrigger
on ssis_no_load
after insert
as
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'DWBIMailProfile',
@execute_query_database = 'warehousedb',
@recipients = 'pareamitp@gmail.com',
@query = 'select * from ssis_no_load',
@subject = 'DWBI Mail Chain',
@body='Attached records are not loaded because adding up validation failed',
@attach_query_result_as_file = 1

 


