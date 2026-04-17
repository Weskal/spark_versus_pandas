IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'gold_spark' AND schema_id = SCHEMA_ID(''gold''))
BEGIN
    CREATE TABLE gold.gold_spark (
        record_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
        customer_id UNIQUEIDENTIFIER,
        order_id UNIQUEIDENTIFIER,
        order_date DATETIME2,
        order_status VARCHAR(10),
        total_revenue DECIMAL(12,2),
        total_orders INT,
        avg_ticket DECIMAL(12,2),
        batch_id VARCHAR(50),
        created_at DATETIME2 DEFAULT CURRENT_TIMESTAMP
    );
END
GO