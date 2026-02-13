-- Sales by Year
{{ config(materialized='table') }}

select
  cal_year,
  sum(sales_amount) as total_sales
from {{ ref('mart_sales') }}
group by cal_year
order by cal_year
