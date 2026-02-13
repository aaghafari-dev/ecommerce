{{ config(materialized='table') }}

with source as (
    select * from {{ source('ecommerce_raw', 'client') }}
)

select
    client_id,
    client_name,
    email,
    phone_number,
    address,
    type_id,
    status_id,
    registration_date
from source
