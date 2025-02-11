with sales_reason as (
    select * 
    from {{ ref('int_sales__sales_reasons') }}
)

select *
from sales_reason