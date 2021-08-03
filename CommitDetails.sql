Drop table CommitDetails;
Create table CommitDetails(Repository NCHAR(50),CommittedID NCHAR(50), Branch NCHAR(50),CommitDate NCHAR(50),CommittedAuthor NCHAR(50))
SELECT Repository,CommittedID , Branch ,CommitDate ,CommittedAuthor FROM OPENROWSET(
    BULK  'Blob/CommitDetails_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage26',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (Repository NCHAR(50),CommittedID NCHAR(50), Branch NCHAR(50),CommitDate NCHAR(50),CommittedAuthor NCHAR(50)) as CommitDetail
INSERT INTO CommitDetails with (TABLOCK) (Repository,CommittedID , Branch ,CommitDate ,CommittedAuthor)
 SELECT Repository,CommittedID , Branch ,CommitDate ,CommittedAuthor FROM OPENROWSET(
    BULK  'Blob/CommitDetails_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage26',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (Repository NCHAR(50),CommittedID NCHAR(50), Branch NCHAR(50),CommitDate NCHAR(50),CommittedAuthor NCHAR(50)) as CommitDetail