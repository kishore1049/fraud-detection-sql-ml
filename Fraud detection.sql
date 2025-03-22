-- Drop the table if it exists
IF OBJECT_ID('dbo.transactions', 'U') IS NOT NULL
    DROP TABLE dbo.transactions;

-- Create the transactions table
CREATE TABLE dbo.transactions (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    transaction_date DATETIME
);

USE [fraud_detection];  -- Replace with your actual database name

-- Drop the table if it exists
IF OBJECT_ID('dbo.transactions', 'U') IS NOT NULL
    DROP TABLE dbo.transactions;

-- Create the transactions table
CREATE TABLE dbo.transactions (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    transaction_date DATETIME
);

-- Insert 100 dummy transactions
DECLARE @counter INT = 1;

WHILE @counter <= 100
BEGIN
    -- Randomly generate amount between 1000 and 20000
    DECLARE @amount DECIMAL(10, 2) = ROUND((RAND() * 19000) + 1000, 2);

    -- Set transaction date as current date and time
    DECLARE @trans_date DATETIME = GETDATE();

    -- Insert the generated transaction into the table
    INSERT INTO dbo.transactions (transaction_id, amount, transaction_date)
    VALUES (@counter, @amount, @trans_date);

    -- Increment counter for the next transaction
    SET @counter = @counter + 1;
END


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'transactions';


SELECT * FROM dbo.transactions;

SELECT * FROM dbo.transactions WHERE amount > 5000;

SELECT * FROM dbo.transactions WHERE amount <= 5000;


USE fraud_detection;

SELECT 
    transaction_id, 
    amount, 
    transaction_date, 
    DATEPART(HOUR, transaction_date) AS transaction_hour,
    DATEDIFF(DAY, MIN(transaction_date) OVER (), transaction_date) AS days_since_first_txn,
    COUNT(*) OVER (PARTITION BY transaction_date) AS transactions_per_day,
    AVG(amount) OVER (PARTITION BY transaction_date) AS avg_amount_per_day
FROM dbo.transactions;



