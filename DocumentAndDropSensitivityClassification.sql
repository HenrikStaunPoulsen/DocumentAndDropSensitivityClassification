
-- list current status
select '-- today = ' + convert(nvarchar(19), getdate(), 121) union all
SELECT 'add sensitivity classification to ' + schema_name(O.schema_id) + '.[' + O.NAME + '].[' + c.NAME + '] with (label= ''' + cast(sc.label as nvarchar(100)) + ''' , information_type = ''' + cast(sc.information_type as nvarchar(100)) + ''' )'
FROM sys.sensitivity_classifications sc
    JOIN sys.objects O on  sc.major_id = O.object_id
	JOIN sys.columns C ON  sc.major_id = C.object_id  AND sc.minor_id = C.column_id
    inner join sys.tables t on t.object_id = O.object_id
    where t.temporal_type_desc <> 'HISTORY_TABLE'

-- drop all
SELECT 'drop sensitivity classification from ' + schema_name(O.schema_id) + '.[' + O.NAME + '].[' + c.NAME + ']'
FROM sys.sensitivity_classifications sc
    JOIN sys.objects O ON  sc.major_id = O.object_id
	JOIN sys.columns C ON  sc.major_id = C.object_id  AND sc.minor_id = C.column_id
    inner join sys.tables t on t.object_id = O.object_id
    where t.temporal_type_desc <> 'HISTORY_TABLE'
