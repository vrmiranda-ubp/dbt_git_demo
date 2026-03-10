with 

source as (

    select * from {{ source('rm360', 'rm360_calendar_table') }}

),

renamed as (

    select business_date
        , processing_date
        , remarks
    from source

)

select * from renamed