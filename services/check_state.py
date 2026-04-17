check_query = """
SELECT *
    FROM raw.events
    WHERE 
        ingestion_timestamp > last_timestamp
        OR (
            ingestion_timestamp = last_timestamp
            AND event_id > last_event_id
        )
    ORDER BY ingestion_timestamp
    LIMIT 1000
"""