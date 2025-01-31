with 
    sales_order_sales_reason as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

    , renamed as (
        select
            cast(SALESREASONID as string) as fk_sales_reason_id
            , cast(SALESORDERID as string) as fk_sales_order_id
            , cast(MODIFIEDDATE as date) as  modified_date
        from sales_order_sales_reason
    )

select *
from renamed