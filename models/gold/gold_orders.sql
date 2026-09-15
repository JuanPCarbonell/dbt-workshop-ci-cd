-- models/gold/gold_orders.sql   (grano: un pedido; base del Webinar 3)
{{ config(materialized='table') }}
select
    order_id,
    customer_id,
    order_date,
    order_status,
    net_revenue
from {{ ref('silver_orders_enriched') }}