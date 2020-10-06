# DocumentAndDropSensitivityClassification
How to document and drop all Sensitivity Classification

as in: generate a lot of SQL code to be able to 

1) recreate all the "add sensitivity classification to" statements that were added to your database
2) drop all the classifications from your database


The reason you may want to do this?
There is currently a bug in Azure SQL Database, that causes error messages to show 6 stars instead of a table name, column name.
See https://dba.stackexchange.com/questions/273325/string-or-binary-data-would-be-truncated-in-table-column-tru for more info
