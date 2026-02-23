with 

cust as (

    select
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment
    from {{ source('finacle', 'customer') }}

),
ord as (
        select O_ORDERKEY
            , O_CUSTKEY
            , O_ORDERSTATUS
            , O_TOTALPRICE
            , O_ORDERDATE
            , O_ORDERPRIORITY
            , O_CLERK
            , O_SHIPPRIORITY
            , O_COMMENT
        from  {{ source('finacle', 'orders') }}
)
, 
final as (
    select O_ORDERKEY
        , c_name
        , sum(O_TOTALPRICE) customer_total
    from ord 
    left join cust
    on ord.O_CUSTKEY = cust.c_custkey
    group by O_ORDERKEY
        , c_name
)

select * from final