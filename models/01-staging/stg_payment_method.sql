{{ config(materialized='table') }}

select
    payment_id,
    payment_method
from {{ source('ecommerce_raw', 'payment_method') }}
