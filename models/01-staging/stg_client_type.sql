{{ config(materialized='table') }}

select
    client_type_id,
    type_name
from {{ source('ecommerce_raw', 'client_type') }}
