SELECT 
b.type_desc AS [File type],
SUM(b.size * 8) AS [Total size (kb)]
FROM sys.dm_io_virtual_file_stats(NULL,NULL) a
JOIN sys.master_files b ON a.database_id = b.database_id AND a.file_id = b.file_id
JOIN sys.databases c ON a.database_id = c.database_id 
GROUP BY b.type_desc