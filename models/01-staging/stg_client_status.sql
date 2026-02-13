{{ config(materialized='table') }}

select
    client_status_id,
    status_name
from {{ source('ecommerce_raw', 'client_status') }}
