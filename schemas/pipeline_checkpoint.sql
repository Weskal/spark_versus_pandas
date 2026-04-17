IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'control')
BEGIN
    EXEC('CREATE SCHEMA control');
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'pipeline_checkpoint' AND schema_id = SCHEMA_ID(''control''))
BEGIN
    CREATE TABLE control.pipeline_checkpoint (
        record_id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
        pipeline_name VARCHAR(100),
        last_processed_id BIGINT,
        updated_at DATETIME2 DEFAULT CURRENT_TIMESTAMP
    );
END
GO