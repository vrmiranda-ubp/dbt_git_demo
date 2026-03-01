{{ config
    (materialized='view'
        , snowflake_warehouse=env_var("DBT_WH_T1"))
}}

with 

source as (

    select * from {{ source('finacle', 'region') }}

),

renamed as (

    select
        r_regionkey,
        r_name,
        r_comment

    from source

)

select * from renamed