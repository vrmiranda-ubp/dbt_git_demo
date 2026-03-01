
{{ config
    (materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1")
        , schema=env_var("DBT_CDP_SCHEMA"))
}}

with
source as (

select * from {{ ref ('stg_finacle_orders') }}

),

final as (

    select o_custkey, o_orderstatus, sum(O_TOTALPRICE) as o_totalprice, count(*) as ordercount
    from source
    group by o_custkey, o_orderstatus

)

select * from final