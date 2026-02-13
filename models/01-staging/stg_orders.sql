{{ config(materialized='table') }}

select
    order_id,
    client_id,
    payment_id,

    -- TIMESTAMP → DATE (correct & safe)
    CAST(order_date AS DATE) AS order_date,

    status,
    total_amount
from {{ source('ecommerce_raw', 'orders') }}
where order_date is not null
