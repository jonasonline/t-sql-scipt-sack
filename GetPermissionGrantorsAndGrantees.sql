SELECT b.name AS [Grantor], c.name AS [Grantee], a.class_desc, a.permission_name, a.state_desc FROM sys.server_permissions a
JOIN sys.server_principals b ON a.grantor_principal_id = b.principal_id
JOIN sys.server_principals c ON a.grantee_principal_id = c.principal_id