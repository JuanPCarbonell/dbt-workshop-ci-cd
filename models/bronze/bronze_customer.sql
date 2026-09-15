-- models/bronze/bronze_customer.sql
select
    c_custkey    as customer_id,
    c_name       as customer_name,
    c_mktsegment as market_segment,
    c_acctbal    as account_balance,
    c_nationkey  as nation_id
from {{ source('tpch', 'CUSTOMER') }}