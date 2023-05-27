{{ config(materialized='table') }}

select * from {{ var("source_db") }}.{{ var("source_sch") }}.{{ var("source_table") }}