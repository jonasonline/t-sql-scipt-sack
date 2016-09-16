SELECT create_date as 'Server Install Date'
FROM sys.server_principals 
WHERE name = 'NT AUTHORITY\SYSTEM'