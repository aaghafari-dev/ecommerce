{% macro generate_dates_dimension(start_date) %}

WITH dates AS (
  SELECT 
    DATEADD(day, SEQ4(), '{{ start_date }}'::DATE) AS date
  FROM TABLE(GENERATOR(ROWCOUNT => 10000))
),

dates_fin AS (
SELECT 
  date AS calendar_date,
  EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
  TO_CHAR(date,'DY') AS day_of_week_name,
  DATE_TRUNC('WEEK', date) AS cal_week_start_date,
  EXTRACT(DAY FROM date) AS day_of_month,
  EXTRACT(MONTH FROM date) AS cal_month,
  TO_CHAR(date,'MMMM') AS cal_month_name,
  TO_CHAR(date,'MON') AS cal_month_name_short,
  EXTRACT(QUARTER FROM date) AS cal_quarter,
  CONCAT('Q', EXTRACT(QUARTER FROM date)) AS cal_quarter_name,
  EXTRACT(YEAR FROM date) AS cal_year,
  CASE 
    WHEN EXTRACT(DAYOFWEEK FROM date) IN (6, 7) THEN TRUE
    ELSE FALSE
  END AS is_weekend
FROM dates
WHERE date <= DATEADD(MONTH, 12, CURRENT_DATE())
)

SELECT 
  ROW_NUMBER() OVER (ORDER BY calendar_date) AS date_id,
  calendar_date,
  day_of_week,
  day_of_week_name,
  cal_week_start_date,
  day_of_month,
  cal_month,
  cal_month_name,
  cal_month_name_short,
  cal_quarter,
  cal_quarter_name,
  cal_year,
  is_weekend
FROM dates_fin

{% endmacro %}
