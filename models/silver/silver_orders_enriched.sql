-- models/silver/silver_orders_enriched.sql
-- Grano: un pedido. Agrega las lineas y anade cliente y pais.
with lines as (select * from {{ ref('silver_order_lines') }}),
     customer as (select * from {{ ref('bronze_customer') }}),
     nation   as (select * from {{ ref('bronze_nation') }})
select
    lines.order_id,
    lines.customer_id,
    lines.order_date,
    lines.order_status,
    lines.order_priority,
    sum(lines.net_revenue) as net_revenue,
    count(*)               as line_count,
    customer.market_segment,
    nation.nation_name
from lines
join customer on lines.customer_id = customer.customer_id
join nation   on customer.nation_id = nation.nation_id
group by lines.order_id, lines.customer_id, lines.order_date,
         lines.order_status, lines.order_priority,
         customer.market_segment, nation.nation_name