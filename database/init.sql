-- Create gold_layer_db database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'gold_layer_db')
BEGIN
    CREATE DATABASE gold_layer_db;
END
GO

USE gold_layer_db;
GO

-- Optional: Create basic schema
IF SCHEMA_ID('gold') IS NULL
BEGIN
    EXEC('CREATE SCHEMA gold');
END
