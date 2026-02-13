{{ config(alias='fct_orders',
    materialized='incremental',
    unique_key='order_product_id',
    tags=['star_schema']
) }}

select
    op.order_product_id,
    o.order_id,
    t.date_id,
    o.client_id,
    o.payment_id,
    op.product_id,
    op.quantity,
    op.quantity * op.price_unit as sales_amount
from {{ ref('stg_orders') }} o
join {{ ref('stg_order_product') }} op
  on o.order_id = op.order_id
join {{ ref('dim_time') }} t
  on o.order_date = t.calendar_date
