
{{ config
    (
        materialized='view'
        , snowflake_warehouse=env_var("DBT_WH_T1")
    ) 
}}

with 

source as (

    select * from {{ source('finacle', 'nation') }}

),

final as (

    select
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment

    from source

)

select * from final