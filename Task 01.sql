USE Travel

--To identify rows with missing values:
SELECT * 
FROM dbo.[ Travel]
WHERE [Year] IS NULL 
   OR [Passenger_cars]  IS NULL
   OR [Buses] IS NULL
   OR [Rail] IS NULL
   OR [Air] IS NULL
   OR [Other] IS NULL
   OR [Total] IS NULL;


--Validate Data Ranges
SELECT *
FROM dbo.[ Travel]
WHERE [Passenger_cars]  < 0
   OR [Buses] < 0
   OR [Rail] < 0;

  
--To fill missing numerical values with 0:

UPDATE dbo.[ Travel]
SET [Passenger_cars] = 0
WHERE [Passenger_cars] IS NULL;

--Remove Irrelevant Data
DELETE FROM dbo.[ Travel]
WHERE [Total] = 0;


--Check for Cleaned Data
SELECT * 
FROM dbo.[ Travel]