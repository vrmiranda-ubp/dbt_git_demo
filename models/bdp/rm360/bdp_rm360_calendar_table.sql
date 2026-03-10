with 

source as (

    select * from {{ source('rm360', 'bdp_rm360_calendar_table') }}

),

renamed as (

    select *

    from source

)

select * from renamed