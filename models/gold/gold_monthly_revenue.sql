-- models/gold/gold_monthly_revenue.sql   (downstream del Webinar 1)
{{ config(materialized='table') }}
select
    date_trunc('month', order_date) as order_month,
    count(*)         as order_count,
    sum(net_revenue) as net_revenue,
    avg(net_revenue) as avg_order_revenue
from {{ ref('gold_orders') }}
group by 1
order by 1