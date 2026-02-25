{{ config
    (
        materialized='table'
        , snowflake_warehouse=env_var("DBT_WH_T1")
    ) 
}}

with 

source as (

    select * from {{ source('finacle', 'part') }}

),

renamed as (

    select
        p_partkey,
        p_name,
        p_mfgr,
        p_brand,
        p_type,
        p_size,
        p_container,
        p_retailprice,
        p_comment

    from source

)

select * from renamed