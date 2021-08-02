Drop table Pullrequests;
Create table Pullrequests(CreatedBy NCHAR(50),SourceBranch NCHAR(50), DestinationBranch NCHAR(50),Pull_Request_Number NCHAR(50),Repository NCHAR(50),Creation_Date NCHAR(50),Pull_Request_Status NCHAR(50),Reviewers NCHAR(50),Approvers NCHAR(50) )
SELECT CreatedBy ,SourceBranch , DestinationBranch ,Pull_Request_Number ,Repository ,Creation_Date ,Pull_Request_Status ,Reviewers ,Approvers FROM OPENROWSET(
    BULK  'Blob/Pullrequests_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage26',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (CreatedBy NCHAR(50),SourceBranch NCHAR(50), DestinationBranch NCHAR(50),Pull_Request_Number NCHAR(50),Repository NCHAR(50),Creation_Date NCHAR(50),Pull_Request_Status NCHAR(50),Reviewers NCHAR(50),Approvers NCHAR(50)) as Pullrequest
INSERT INTO Pullrequests with (TABLOCK) (CreatedBy ,SourceBranch , DestinationBranch ,Pull_Request_Number ,Repository ,Creation_Date ,Pull_Request_Status ,Reviewers ,Approvers)
 SELECT CreatedBy ,SourceBranch , DestinationBranch ,Pull_Request_Number ,Repository ,Creation_Date ,Pull_Request_Status ,Reviewers ,Approvers FROM OPENROWSET(
    BULK  'Blob/Pullrequests_Final.json',
    DATA_SOURCE = 'MyAzureBlobStorage26',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (CreatedBy NCHAR(50),SourceBranch NCHAR(50), DestinationBranch NCHAR(50),Pull_Request_Number NCHAR(50),Repository NCHAR(50),Creation_Date NCHAR(50),Pull_Request_Status NCHAR(50),Reviewers NCHAR(50),Approvers NCHAR(50)) as Pullrequest