SELECT name AS index_name, STATS_DATE(OBJECT_ID, index_id) AS StatisticsLastUpdated
FROM sys.indexes
WHERE OBJECT_ID = OBJECT_ID('TableName')
GO