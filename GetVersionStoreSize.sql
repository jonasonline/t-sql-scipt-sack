SELECT SUM(version_store_reserved_page_count) AS [version store pages used], 
(SUM(version_store_reserved_page_count)*1.0/128) AS [version store space in MB] 
FROM sys.dm_db_file_space_usage; 