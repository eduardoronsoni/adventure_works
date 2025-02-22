with 
    sales_reason as (
        select *
        from {{ ref('stg_erp__sales_reason') }}
    )

    , sales_order_sales_reason as (
        select *
        from {{ ref('stg_erp__sales_order_sales_reason') }}
    )



select 
    sales_order_sales_reason.FK_SALES_ORDER_ID 
    , sales_reason.SALES_REASON
    , sales_reason.SALES_REASON_TYPE
from sales_order_sales_reason
left join sales_reason on sales_order_sales_reason.FK_SALES_REASON_ID = sales_reason.PK_SALES_REASON_ID
    
