{{ config(materialized='table') }}

select
    order_product_id,
    order_id,
    product_id,
    quantity,
    price_unit
from {{ source('ecommerce_raw', 'order_product') }}
