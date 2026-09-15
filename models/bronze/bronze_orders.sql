-- models/bronze/bronze_orders.sql
select
    o_orderkey      as order_id,
    o_custkey       as customer_id,
    o_orderstatus   as order_status,
    o_orderpriority as order_priority,
    o_totalprice    as total_price,
    o_orderdate     as order_date
from {{ source('tpch', 'ORDERS') }}