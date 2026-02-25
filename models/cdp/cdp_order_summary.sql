
{{ config
    (materialized='ephemeral'
        , snowflake_warehouse=env_var("DBT_WH_T1"))
}}

with
source as (

select * from {{ ref ('stg_finacle_orders') }}

),

final as (

    select o_custkey, o_orderstatus, sum(O_TOTALPRICE) 
    from source
    group by o_custkey, o_orderstatus

)

select * from final