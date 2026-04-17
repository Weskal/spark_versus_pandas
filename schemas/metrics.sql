IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'monitoring')
BEGIN
    EXEC('CREATE SCHEMA monitoring');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'metrics' AND schema_id = SCHEMA_ID(''monitoring''))
BEGIN
    CREATE TABLE monitoring.metrics (
        metric_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
        engine VARCHAR(20),         -- pandas ou spark
        step VARCHAR(50),           -- extract / transform / load
        duration_seconds DECIMAL(10,4),
        rows_processed INT,
        batch_id VARCHAR(50),
        created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP
    );
END
GO