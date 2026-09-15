-- models/silver/silver_order_lines.sql
-- Grano: una linea de pedido. net_revenue = precio con descuento.
with lineitem as (select * from {{ ref('bronze_lineitem') }}),
     orders   as (select * from {{ ref('bronze_orders') }})
select
    l.order_id,
    o.customer_id,
    l.part_id,
    l.line_number,
    l.ship_mode,
    l.ship_date,
    l.quantity,
    l.extended_price,
    l.discount,
    round(l.extended_price * (1 - l.discount), 2) as net_revenue,
    o.order_status,
    o.order_date,
    o.order_priority
from lineitem l
join orders o using (order_id)