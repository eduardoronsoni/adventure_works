with 
    int_locations as (
        select * 
        from {{ ref('int_people__locations') }}
    )

select *
from int_locations