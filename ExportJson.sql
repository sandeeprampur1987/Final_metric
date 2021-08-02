Drop table Issues;
Create table Issues( Issue_title NCHAR(50),Issue_state NCHAR(50), Issue_Number NCHAR(50),Issue_Opened_By NCHAR(50),Issued_Date NCHAR(50) )
SELECT Issue_title,Issue_state, Issue_Number,Issue_Opened_By,Issued_Date FROM OPENROWSET(
    BULK  'Blob/Issues_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage25',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (Issue_title NCHAR(50),Issue_state NCHAR(50), Issue_Number NCHAR(50),Issue_Opened_By NCHAR(50),Issued_Date NCHAR(50)) as book
INSERT INTO Issues with (TABLOCK) (Issue_title,Issue_state,Issue_Number,Issue_Opened_By,Issued_Date)
 SELECT Issue_title,Issue_state,Issue_Number,Issue_Opened_By,Issued_Date FROM OPENROWSET(
    BULK  'Blob/Issues_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage25',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (Issue_title NCHAR(50),Issue_state NCHAR(50), Issue_Number NCHAR(50),Issue_Opened_By NCHAR(50),Issued_Date NCHAR(50)) as Issue
