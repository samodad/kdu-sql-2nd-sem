USE  [Task 02]

UPDATE Jobs
SET "Jan" = NULLIF("Jan", '--'),
    "Feb" = NULLIF("Feb", '--'),
    "Mar" = NULLIF("Mar", '--'),
    "Q1_Total" = NULLIF("Q1_Total", '--'),
    "Apr" = NULLIF("Apr", '--'),
    "May" = NULLIF("May", '--'),
    "Jun" = NULLIF("Jun", '--'),
    "Q2_Total" = NULLIF("Q2_Total", '--'),
    "Jul" = NULLIF("Jul", '--'),
    "_2024_Total"  = NULLIF("_2024_Total", '--');

UPDATE Jobs
SET "Province_territory_and_occupation"  = TRIM(LOWER("Province_territory_and_occupation" ));


UPDATE Jobs
SET "Jan" = REPLACE("Jan", ',', ''),
    "Feb" = REPLACE("Feb", ',', ''),
    "Mar" = REPLACE("Mar", ',', ''),
    "_2024_Total"  = REPLACE("_2024_Total" , ',', '');


UPDATE Jobs
SET "Jan" = TRY_CAST(REPLACE("Jan", ',', '') AS INT),
    "Feb" = TRY_CAST(REPLACE("Feb", ',', '') AS INT),
    "Mar" = TRY_CAST(REPLACE("Mar", ',', '') AS INT),
    "_2024_Total"  = TRY_CAST(REPLACE("_2024_Total" , ',', '') AS INT);


UPDATE Jobs
SET "Jan" = COALESCE(TRY_CAST(REPLACE("Jan", ',', '') AS INT), 0),
    "Feb" = COALESCE(TRY_CAST(REPLACE("Feb", ',', '') AS INT), 0),
    "Mar" = COALESCE(TRY_CAST(REPLACE("Mar", ',', '') AS INT), 0),
    "_2024_Total" = COALESCE(TRY_CAST(REPLACE("_2024_Total", ',', '') AS INT), 0);

SELECT "Jan", "Feb", "Mar", "_2024_Total"
FROM Jobs;

UPDATE Jobs
SET "Jan" = COALESCE("Jan", 0),
    "Feb" = COALESCE("Feb", 0),
    "Mar" = COALESCE("Mar", 0),
    "_2024_Total"  = COALESCE("_2024_Total", 0);
	
ALTER TABLE Jobs DROP COLUMN "Q1_Total9";
ALTER TABLE Jobs DROP COLUMN "Q2_Total9";
ALTER TABLE Jobs DROP COLUMN "Jul9";
ALTER TABLE Jobs DROP COLUMN "Total_2024";


EXEC sp_rename 'dbo.Jobs.[_2024_Total]', 'Total_2024', 'COLUMN';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Jobs';


ALTER TABLE Jobs
ALTER COLUMN [Jan] INT;

ALTER TABLE Jobs
ALTER COLUMN [Feb] INT;

ALTER TABLE Jobs
ALTER COLUMN [Mar] INT;

ALTER TABLE Jobs
ALTER COLUMN [Total_2024] INT;

