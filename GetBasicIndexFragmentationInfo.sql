DECLARE @db_id smallint

SET @db_id = DB_ID()
SELECT
	c.name as table_name,
    b.name AS index_name,
	a.object_id AS objectid,
	a.index_id AS indexid,
    a.partition_number AS partition_number,
    a.avg_fragmentation_in_percent AS percent_fragmentation,
    a.page_count AS Pages,
    a.fragment_count AS Fragments
FROM sys.dm_db_index_physical_stats (@db_id, NULL, NULL , NULL, 'LIMITED') a
JOIN sys.indexes b on b.object_id = a.object_id AND b.index_id = a.index_id
JOIN sys.objects c on a.object_id = c.object_id
WHERE a.avg_fragmentation_in_percent > 5.0 AND a.index_id > 0
GO