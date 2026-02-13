-- Sales by Payment Method
{{ config(materialized='table') }}

select
  payment_method,
  sum(sales_amount) as total_sales
from {{ ref('mart_sales') }}
group by payment_method
order by total_sales desc
