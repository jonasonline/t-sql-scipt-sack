SELECT 
GETDATE() AS [Date],
SERVERPROPERTY('MachineName') AS [MashineName],
ISNULL(SERVERPROPERTY('InstanceName'), 'DefaultInstance') AS [InstanceName],
c.name AS [DatabaseName], 
b.name AS [FileName], 
b.type_desc, 
b.physical_name AS [FilePath],
a.num_of_reads, 
a.num_of_writes, 
a.io_stall, 
b.size * 8 AS [Size (kb)]
FROM sys.dm_io_virtual_file_stats(NULL,NULL) a
JOIN sys.master_files b ON a.database_id = b.database_id AND a.file_id = b.file_id
JOIN sys.databases c ON a.database_id = c.database_id 
