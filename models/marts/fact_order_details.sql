with
    int_order_details as (
        select *
        from {{ ref('int_sales__order_details') }}
    )

select * 
from int_order_details