-- Execute from a user database 
SELECT 'ALTER USER [' + dp.name + '] WITH Login = [' + dp.name + '];' AS [Alter command], dp.type_desc, dp.SID, dp.name AS user_name  
FROM sys.database_principals AS dp  
LEFT JOIN sys.server_principals AS sp  
    ON dp.SID = sp.SID  
WHERE sp.SID IS NULL  
    AND authentication_type_desc = 'INSTANCE';  