with 
    sales_reason as (
        select * from {{ ref('stg_erp__sales_reason') }}
    )

select *
from sales_reason