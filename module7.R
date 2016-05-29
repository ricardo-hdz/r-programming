connStr <- paste(
'Server'='msedxeus.database.windows.net',
'Database'='DAT209x01',
'uid'='Rlogin',
'pwd'='P@assw0rd'
'Driver'='{SQL Server}',
'sep'=';'
);
conn <- odbcDriverConnect(connStr)
descTable<-sqlTables(conn, tableName='Sentiment')
rows<-sqlFetch(conn,"SELECT count(*) from schema.Sentiment")


Exercise 7.2 Construct a dataset based on the table ‘sentiment’ from Exercise 7.1 with average score by Date for the State ’WA’. The dataset should also contain the column ’Date’. Server Name: msedxeus.database.windows.net Database Name: DAT209x01 User ID: Rlogin Password: P@ssw0rd

sentiment <- sqlFetch(conn, 'SELECT AVG(score),  Date WHERE STATE="WA" ORDER BY date')