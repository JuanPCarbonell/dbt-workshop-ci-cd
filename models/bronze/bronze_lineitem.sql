-- models/bronze/bronze_lineitem.sql
select
    l_orderkey      as order_id,
    l_partkey       as part_id,
    l_suppkey       as supplier_id,
    l_linenumber    as line_number,
    l_quantity      as quantity,
    l_extendedprice as extended_price,
    l_discount      as discount,
    l_shipmode      as ship_mode,
    l_shipdate      as ship_date,
    l_returnflag    as return_flag
from {{ source('tpch', 'LINEITEM') }}