-- Sales by Product Category
{{ config(materialized='table') }}

select
  category,
  sum(sales_amount) as total_sales
from {{ ref('mart_sales') }}
group by category
order by total_sales desc
