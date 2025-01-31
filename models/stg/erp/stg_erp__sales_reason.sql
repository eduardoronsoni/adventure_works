with
    sales_reason as (
        select *
        from {{ source('erp', 'salesreason') }}
    )

    , renamed as (
        select
            , cast(SALESREASONID as string) as pk_sales_reason_id
            , cast(NAME as string) as sales_reason
            , cast(REASONTYPE as string) as sales_reason_type
            , cast(MODIFIEDDATE as date) as modified_Date
        from sales_reason
    )

select *
from renamed

